import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/listview_separated_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/row_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
    final theme = AppTheme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leadingWidth: 70,
          leading: const CircleAvatar(),
          title: Text(
            data.txtProductTitle,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 20,
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
                TextField(
                  cursorColor: theme.colors.text,
                  decoration: InputDecoration(
                    hintText: data.txtFieldHint,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Inter',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: theme.colors.textSubtle, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: theme.colors.textSubtle, width: 1),
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: theme.colors.textSubtlest,
                    ),
                  ),
                ),
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
                GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: 5,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: theme.spaces.space_250,
                      mainAxisSpacing: theme.spaces.space_250,
                      mainAxisExtent: theme.spaces.space_900 * 2.75),
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(theme.spaces.space_100),
                        border: Border.all(
                            width: 0.5, color: theme.colors.textInverse)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: theme.spaces.space_150),
                      child: Column(
                        children: [
                          Container(
                            width: theme.spaces.space_500 * 3.7,
                            height: theme.spaces.space_500 * 3.7,
                            decoration: BoxDecoration(
                              color: theme.colors.textInverse,
                            ),
                          ),
                          SizedBox(
                            height: theme.spaces.space_50,
                          ),
                          const Text("data"),
                        ],
                      ),
                    ),
                  ),
                ),
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
