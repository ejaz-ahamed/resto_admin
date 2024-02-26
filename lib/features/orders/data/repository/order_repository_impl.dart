import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/user_firestore/user_firestore_datasourse.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/user_firestore/user_firestore_datasourse_impl.dart';
import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';
import 'package:resto_admin/features/orders/data/datasource/order_datasource.dart';
import 'package:resto_admin/features/orders/data/datasource/order_datasource_impl.dart';
import 'package:resto_admin/features/orders/data/model/order_model.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/domain/entity/order_item_entity.dart';
import 'package:resto_admin/features/orders/domain/repository/order_repository.dart';
import 'package:resto_admin/features/products/data/datasources/product_firestore_datasource.dart';
import 'package:resto_admin/features/products/data/datasources/product_firestore_datasource_impl.dart';
import 'package:resto_admin/features/products/data/models/product_model.dart';
import 'package:resto_admin/features/products/domain/entities/product_addon_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_type_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'order_repository_impl.g.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderFirestoreDataSource dataSource;
  final UserFirestoreDatasourse userDataSource;
  final ProductFireStoreDataSource productDataSource;

  OrderRepositoryImpl({
    required this.dataSource,
    required this.productDataSource,
    required this.userDataSource,
  });

  /// Convert the order model into entity
  Future<OrderEntity> _getOrderEntityFromModel(OrderModel order) async {
    /// Future for getting the user details
    final userDataFuture = userDataSource.getUserOnce(order.uid);
    final productsDataFutures = <Future<ProductModel>>[];

    /// Create the futures for getting the product details
    for (final item in order.items) {
      productsDataFutures.add(productDataSource.getById(item.productId));
    }

    final productDetails = await Future.wait(productsDataFutures);
    final userData = await userDataFuture;

    return OrderEntity(
      id: order.id,
      user: UserEntity(
        imgPath: userData.imgPath,
        name: userData.name,
        uid: userData.uid,
      ),
      location: order.location,
      time: order.time,
      items: [
        for (var i = 0; i < order.items.length; i++)
          OrderItemEntity(
            product: ProductEntity(
              name: productDetails[i].name,
              imagePath: productDetails[i].imagePath,
              description: productDetails[i].description,
              categoryId: productDetails[i].categoryId,
              id: productDetails[i].id,
              types: [
                for (final type in productDetails[i].types)
                  ProductTypeEntity(
                    name: type.name,
                    price: type.price,
                    id: type.id,
                  )
              ],
              addOns: [
                for (final addon in productDetails[i].addOns)
                  ProductAddOnEntity(
                    name: addon.name,
                    id: addon.id,
                    price: addon.price,
                  )
              ],
              availableFrom: productDetails[i].availableFrom,
              availableUpTo: productDetails[i].availableUpTo,
            ),
            type: order.items[i].type,
            quantity: order.items[i].quantity,
          )
      ],
      orderStatus: order.orderStatus,
    );
  }

  @override
  Stream<List<OrderEntity>> getOrderByType(OrderStatus orderStatus) async* {
    final orders = dataSource.getAll(orderStatus);

    await for (final ordersList in orders) {
      final ordersEntityList = <OrderEntity>[];

      for (final order in ordersList) {
        ordersEntityList.add(await _getOrderEntityFromModel(order));
      }

      yield ordersEntityList;
    }
  }

  @override
  Future<void> updateOrderType(String orderId, OrderStatus newType) async {
    await dataSource.updateType(orderId, newType);
  }

  @override
  Future<List<OrderEntity>> search(OrderStatus orderStatus) async {
    final orders = await dataSource.search(orderStatus);
    final result = [
      for (final data in orders) await _getOrderEntityFromModel(data)
    ];
    return result;
  }
}

@riverpod
OrderRepository orderRepository(OrderRepositoryRef ref) {
  return OrderRepositoryImpl(
    dataSource: ref.read(orderFirestoreDataSourceProvider),
    productDataSource: ref.read(productFireStoreDataSourceProvider),
    userDataSource: ref.read(userFirestoreDatasourseProvider),
  );
}
