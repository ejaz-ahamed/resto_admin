import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    final space = AppTheme.of(context).spaces;
    final color = AppTheme.of(context).colors;
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .7,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(
          height: space.space_200,
        ),
        itemBuilder: (context, index) => Padding(
          padding:
              EdgeInsets.only(left: space.space_125, right: space.space_125),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: space.space_25 * .5, color: color.textInverse),
                borderRadius: BorderRadius.circular(space.space_100)),
            height: MediaQuery.sizeOf(context).height * .1,
            child: ListTile(
              leading: CircleAvatar(
                radius: space.space_400,
              ),
              title: const Text("Order Id"),
              subtitle: const Text("place details"),
            ),
          ),
        ),
      ),
    );
  }
}
