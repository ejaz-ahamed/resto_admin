import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resto_admin/core/constants/offer_constants/edit_offer_page_constants.dart';
import 'package:resto_admin/core/enums/offer_type.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_16_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_8_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';
import 'package:resto_admin/features/offer/presentation/provider/offer_provider.dart';
import 'package:resto_admin/features/offer/presentation/widgets/image_picker_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/listview_products_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/row_heading_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/tab_button_widget.dart.dart';
import 'package:resto_admin/features/offer/presentation/widgets/textfield_widget.dart';

final currentStateProvider = StateProvider<double>((_) => 100);

class EditOfferPage extends HookConsumerWidget {
  static const routePath = '/EditOfferPage';
  final OfferEntity entity;

  const EditOfferPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final percentageController = useTextEditingController();
    EditOfferPageConstants constants = EditOfferPageConstants();
    //Theme data
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    //Selected tab
    final selectedOfferType = useState<OfferType>(OfferType.percentage);

    useEffect(() {
      Future.delayed(Duration.zero, () {
        ref.read(imageProvider.notifier).state = XFile(entity.imagePath);
        nameController.text = entity.name;
        descriptionController.text = entity.description;
        percentageController.text = entity.amount.toString();
      });
      return null;
    }, []);
    //Tabs to Show
    final tabsToShow = useMemoized(() => [
          {
            'text': constants.txtPercentageText,
            'type': OfferType.percentage,
          },
          {
            'text': constants.txtAmountText,
            'type': OfferType.amount,
          },
        ]);
    //Handle tapping on the tab items
    void tabOnPressed(int index) {
      selectedOfferType.value = tabsToShow[index]['type'] as OfferType;
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppTheme.of(context).colors.secondary,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(spaces.space_700),
            child: AppBarWidget(
              title: constants.txtAppbarTitle,
              actionButtonName: constants.txtDelete,
              onPressed: () {
                ref.read(offerProvider.notifier).remove(id: entity.id);
                context.pop();
              },
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox24Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: ImagePickerOfferWidget(
                  imgProvider: imageProvider,
                ),
              ),
              const SizedBox24Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: TextFieldWidget(
                    enabled: true,
                    textFieldTitle: constants.txtTitle,
                    hintText: constants.txtHintTextTitle,
                    controller: nameController),
              ),
              const SizedBox16Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: TextFieldWidget(
                    enabled: true,
                    textFieldTitle: constants.txtDescription,
                    hintText: constants.txtHintTextdescription,
                    controller: descriptionController),
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
                    for (var i = 0; i < tabsToShow.length; i++)
                      TabButtonWidget(
                        buttonText: tabsToShow[i]['text'] as String,
                        isSelected:
                            selectedOfferType.value == tabsToShow[i]['type'],
                        onPressed: () => tabOnPressed(i),
                      ),
                  ],
                ),
              ),
              const SizedBox8Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: TextFieldOfferWidget(
                    hintText: selectedOfferType.value == OfferType.percentage
                        ? constants.txtHintTextPercentage
                        : constants.txtHintTextAmount,
                    controller: percentageController),
              ),
              SizedBox(
                height: spaces.space_200,
              ),
              const RowHeadingWidget(),
              const ListViewProductsWidget(
                offerType: OfferType.amount,
                offerValue: 50.0,
              ),
              const SizedBox8Widget(),
              const SizedBox()
            ],
          ),
        ),
        bottomNavigationBar: ElevatedButtonWidget(
          text: constants.txtSave,
          onPressed: () {
            double amount = double.parse(percentageController.text);
            ref.read(offerProvider.notifier).updateOffer(
                id: entity.id,
                imagePath: ref.watch(imageProvider)!.path,
                name: nameController.text,
                description: descriptionController.text,
                amount: amount,
                offerType: selectedOfferType.value,
                product: []);
            context.pop();
          },
        ),
      ),
    );
  }
}
