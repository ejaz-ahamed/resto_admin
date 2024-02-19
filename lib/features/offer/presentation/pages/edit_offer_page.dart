import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/offer_constants/edit_offer_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/image_picker_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_16_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_8_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';
import 'package:resto_admin/features/offer/presentation/widgets/preffered_appbar_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/row_heading_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/tab_button_widget.dart.dart';
import 'package:resto_admin/features/offer/presentation/widgets/textfield_widget.dart';
class EditOfferPage extends HookConsumerWidget {
  static const routePath = '/EditOfferPage';
  final OfferEntity entity;
  const EditOfferPage({super.key, required this.entity});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    EditOfferPageConstants constants = EditOfferPageConstants();
    //Theme data
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    //Selected tab
    final selectedIndex = useState<int>(0);
    //Tabs to Show
    final tabsText = useMemoized(() => [
          constants.txtPercentageText,
          constants.txtAmountText,
        ]);
    //Handle tapping on the tab items
    void tabOnPressed(int index) {
      selectedIndex.value = index;
    }
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppTheme.of(context).colors.secondary,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(spaces.space_700),
            child: PreferredAppBarWidget(
                title: constants.txtAppbarTitle, btnText: constants.txtDelete)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox24Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: ImagePickerWidget(imgProvider: imageProvider),
              ),
              const SizedBox24Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: TextFieldWidget(
                    textFieldTitle: constants.txtTitle,
                    hintText: constants.txtHintTextTitle,
                    controller: TextEditingController()),
              ),
              const SizedBox16Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: TextFieldWidget(
                    textFieldTitle: constants.txtDescription,
                    hintText: constants.txtHintTextdescription,
                    controller: TextEditingController()),
              ),
              const SizedBox16Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: Row(
                  children: [
                    Text(
                      constants.txtOfferDetails,
                      style: typography.h400,
                    ),
                  ],
                ),
              ),
              const SizedBox16Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: Row(
                  children: [
                    for (var i = 0; i < tabsText.length; i++)
                      TabButtonWidget(
                        buttonText: tabsText[i],
                        isSelected: selectedIndex.value == i,
                        onPressed: () => tabOnPressed(i),
                      ),
                  ],
                ),
              ),
              const SizedBox8Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: TextFieldOfferWidget(
                    hintText: selectedIndex.value == 0
                        ? constants.txtHintTextPercentage
                        : constants.txtHintTextAmount,
                    controller: TextEditingController()),
              ),
              SizedBox(
                height: spaces.space_200,
              ),
              const RowHeadingWidget(),
              const SizedBox8Widget(),
              const SizedBox()
            ],
          ),
        ),
        bottomNavigationBar: ElevatedButtonWidget(
          text: constants.txtSave,
          onPressed: () {},
        ),
      ),
    );
  }
}