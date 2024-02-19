import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/presentation/widgets/text_regular_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/text_widget.dart';

class CustomerDetailsWidget extends ConsumerWidget {
  final OrderEntity entity;
  const CustomerDetailsWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(orderpageConstantsProvider);
    final appTheme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: appTheme.spaces.space_300,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              appTheme.spaces.space_100,
            ),
            border: Border.all(
              color: appTheme.colors.textSubtle,
            )),
        child: Padding(
          padding: EdgeInsets.all(appTheme.spaces.space_200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextWidget(text: constants.txtOrderId),
                  TextWidget(text: constants.txtCustomerName),
                  TextWidget(text: constants.txtTime),
                  TextWidget(text: constants.txtLocation),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextRegularWidget(text: entity.orderId),
                  TextRegularWidget(text: entity.name),
                  TextRegularWidget(text: entity.time),
                  TextRegularWidget(text: entity.location),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
