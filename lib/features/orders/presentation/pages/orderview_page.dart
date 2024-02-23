import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:resto_admin/core/constants/app_constants.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/presentation/widgets/button_container_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/customer_details_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/item_details_listview_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/item_details_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/profile_image_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/total_row_widget.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class OrderViewPage extends ConsumerWidget {
  static const routePath = '/orderviewpage';
  final OrderEntity entity;

  const OrderViewPage({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);

    final constants = ref.watch(orderpageConstantsProvider);
    final appConstants = ref.watch(appConstantsProvider);

    /// Print the bill
    void printBill() async {
      final doc = pw.Document();

      final font = pw.TextStyle(fontFallback: [
        pw.Font.ttf(
            await rootBundle.load('assets/fonts/Inter/Inter-Regular.ttf'))
      ]);

      doc.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Order Details'),
                pw.Divider(),
                pw.Row(
                  children: [
                    pw.Expanded(
                      child: pw.Text('Order ID'),
                    ),
                    pw.Text('#${entity.id}'),
                  ],
                ),
                pw.Row(
                  children: [
                    pw.Expanded(
                      child: pw.Text('Customer Name'),
                    ),
                    pw.Text(entity.user.name),
                  ],
                ),
                pw.Row(
                  children: [
                    pw.Expanded(
                      child: pw.Text('Time'),
                    ),
                    pw.Text(entity.time),
                  ],
                ),
                pw.Row(
                  children: [
                    pw.Expanded(
                      child: pw.Text('Location'),
                    ),
                    pw.Text(entity.location),
                  ],
                ),
                pw.SizedBox(height: appTheme.spaces.space_400),
                pw.Text('Ordered Items'),
                pw.Divider(),
                pw.Row(
                  children: [
                    pw.Expanded(child: pw.Text('Item Name'), flex: 3),
                    pw.Expanded(
                      child: pw.Text('Type', textAlign: pw.TextAlign.center),
                    ),
                    pw.Expanded(
                      child:
                          pw.Text('Quantity', textAlign: pw.TextAlign.center),
                    ),
                    pw.Expanded(
                      child: pw.Text('Price', textAlign: pw.TextAlign.right),
                    ),
                  ],
                ),
                pw.Divider(),
                ...(entity.items.map((orderItem) {
                  final itemType = orderItem.product.types
                      .firstWhere((type) => type.id == orderItem.type);

                  return pw.Row(
                    children: [
                      pw.Expanded(
                          child: pw.Text(orderItem.product.name), flex: 3),
                      pw.Expanded(
                        child: pw.Text(itemType.name,
                            textAlign: pw.TextAlign.center),
                      ),
                      pw.Expanded(
                        child: pw.Text(orderItem.quantity.toString(),
                            textAlign: pw.TextAlign.center),
                      ),
                      pw.Expanded(
                        child: pw.Text(
                          NumberFormat.currency(
                                  symbol: appConstants.moneySymbol)
                              .format(double.parse(itemType.price)),
                          style: font,
                          textAlign: pw.TextAlign.right,
                        ),
                      ),
                    ],
                  );
                }).toList()),
                pw.Divider(),
                pw.Row(
                  children: [
                    pw.Expanded(child: pw.Text('Total'), flex: 3),
                    pw.Expanded(
                      child: pw.Text(
                        NumberFormat.currency(symbol: appConstants.moneySymbol)
                            .format(entity.items.fold<double>(
                                0,
                                (prev, item) =>
                                    double.parse(item.product.types
                                            .where(
                                                (type) => type.id == item.type)
                                            .first
                                            .price) *
                                        item.quantity +
                                    prev)),
                        style: font,
                        textAlign: pw.TextAlign.right,
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      );

      await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => doc.save());
    }

    return Scaffold(
      backgroundColor: appTheme.colors.secondary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appTheme.spaces.space_700),
        child: AppBarWidget(
          title: constants.txtOrderDetails,
          actionButtonName: constants.txtPrint,
          onPressed: printBill,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
            ),
            const SizedBox24Widget(),
            ProfileImageWidget(userDetails: entity.user),
            const SizedBox32Widget(),
            CustomerDetailsWidget(
              entity: entity,
              userDetails: entity.user,
            ),
            const SizedBox24Widget(),
            const ItemDetailsWidget(),
            ItemsDetailsListviewDetails(
              items: entity.items,
            ),
            TotalRowWidget(
              items: entity.items,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtonContainerWidget(
        entity: entity,
      ),
    );
  }
}
