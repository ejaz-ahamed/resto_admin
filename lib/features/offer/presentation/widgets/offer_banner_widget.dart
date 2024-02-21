import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';
import 'package:resto_admin/features/offer/presentation/pages/edit_offer_page.dart';

class OfferBannerWidget extends StatelessWidget {
  final List<OfferEntity> entity;
  const OfferBannerWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: entity.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
              child: InkWell(
                onTap: () =>
                    context.push(EditOfferPage.routePath, extra: entity[index]),
                child: Container(
                  height: AppTheme.of(context).spaces.space_500 * 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(spaces.space_50),
                      color: color.secondary,
                      boxShadow: [AppTheme.of(context).boxShadow.secondary]),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: spaces.space_200,
                        top: spaces.space_200,
                        right: spaces.space_200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: spaces.space_500 * 6,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(entity[index].imagePath),
                                  fit: BoxFit.fill),
                              color: color.textSubtle,
                              borderRadius:
                                  BorderRadius.circular(spaces.space_100)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: spaces.space_100, top: spaces.space_100),
                          child: Text(
                            entity[index].name,
                            style: AppTheme.of(context).typography.h500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: spaces.space_400,
            ),
          ],
        );
      },
    );
  }
}
