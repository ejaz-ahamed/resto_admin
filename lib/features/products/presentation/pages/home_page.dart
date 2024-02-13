import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/gridview_widget.dart';
import 'package:resto_admin/core/widgets/listview_separated_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/row_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/textfield_widget.dart';

class HomePage extends HookConsumerWidget {
  static const routePath = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
    final theme = AppTheme.of(context);
    final searchController = useTextEditingController();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Padding(
            padding: EdgeInsets.only(left: theme.spaces.space_100),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                ),
                SizedBox(
                  width: theme.spaces.space_100 * 2.5,
                ),
                Text(
                  data.txtProductTitle,
                  style: theme.typography.h800,
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: theme.spaces.space_400,
                ),
                SearchTextFieldWidget(searchController: searchController),
                SizedBox(
                  height: theme.spaces.space_300,
                ),
                RowWidget(btnText: data.txtEditbtn, text: data.txtCategory),
                SizedBox(
                  height: theme.spaces.space_250,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 13,
                  child: const ListViewSeparatedWidget(text: 'dio'),
                ),
                SizedBox(
                  height: theme.spaces.space_300,
                ),
                RowWidget(text: data.txtItems, btnText: data.txtAddBtn),
                SizedBox(
                  height: theme.spaces.space_250,
                ),
                const GridViewWidget(),
                SizedBox(
                  height: theme.spaces.space_250,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
