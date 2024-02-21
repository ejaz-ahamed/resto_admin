import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/orders/domain/repository/order_repository.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';

class GetProductByIdUsecase{
  final OrderRepository repository;
  GetProductByIdUsecase({required this.repository});

  Stream <ProductEntity> call(String productId){
    try{
      return repository.getProductById(productId);
    }catch (e){
      throw BaseException("cannot get");
    }

  }


}