import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/offers_constants/offers_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/image_picker_widget.dart';
import 'package:resto_admin/core/widgets/text_fleid_widget.dart';

class OfferAddingPage extends ConsumerWidget {
  const OfferAddingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    final titleController = TextEditingController();
    final subtitleController = TextEditingController();
    final Constants = ref.watch(offersConstantsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: apptheme.colors.secondary,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/ic_arrow_backward.svg'),
            ),
            Text(
              Constants.txtPageTitle,
              style: apptheme.typography.h500
                  .copyWith(color: apptheme.colors.text),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: apptheme.spaces.space_300),
            child: Column(
              children: [
                SizedBox(
                  height: apptheme.spaces.space_200,
                ),
                const ImagePickerWidget(),
                SizedBox(
                  height: apptheme.spaces.space_200,
                ),
                TextFieldWidget(
                    textFielTitle: Constants.txtfeildtitle,
                    hintText: Constants.txtfeildhindtext,
                    controller: titleController),
                SizedBox(
                  height: apptheme.spaces.space_100,
                ),
                TextFieldWidget(
                    textFielTitle: Constants.txtfeildsubtitle,
                    hintText: Constants.txtfeildhindtext2,
                    controller: subtitleController),
                SizedBox(
                  height: apptheme.spaces.space_100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Offer Details",
                      style: apptheme.typography.h400,
                    ),
                    SizedBox(
                      height: apptheme.spaces.space_100,
                    ),
                    Row(
                      children: [
                        Container(
                          height: apptheme.spaces.space_200 * 3,
                          width: apptheme.spaces.space_400 * 4,
                          decoration: BoxDecoration(
                              color: apptheme.colors.primary,
                              borderRadius: BorderRadius.circular(
                                  apptheme.spaces.space_100),
                              border: Border.all(
                                  width: apptheme.spaces.space_100 / 10)),
                          child: Center(
                              child: Text(
                            "Percentage",
                            style: TextStyle(
                                color: apptheme.colors.secondary,
                                fontSize: apptheme.spaces.space_200),
                          )),
                        ),
                        SizedBox(
                          width: apptheme.spaces.space_200,
                        ),
                        Container(
                          height: apptheme.spaces.space_200 * 3,
                          width: apptheme.spaces.space_400 * 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  apptheme.spaces.space_100),
                              border: Border.all(
                                  width: apptheme.spaces.space_100 / 10)),
                          child: Center(
                              child: Text(
                            "Percentage",
                            style: TextStyle(
                                color: apptheme.colors.text,
                                fontSize: apptheme.spaces.space_200),
                          )),
                        )
                      ],
                    ),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0),
                          hintText: "Enter offer percentage",
                          hintStyle: apptheme.typography.h400
                              .copyWith(color: apptheme.colors.textSubtle),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
