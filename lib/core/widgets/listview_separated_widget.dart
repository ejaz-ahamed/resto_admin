import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class ListViewSeparatedWidget extends StatelessWidget {
  const ListViewSeparatedWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_150),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: theme.spaces.space_250,
                  ),
                  Text(text)
                ],
              ),
            ),
        separatorBuilder: (context, index) => const SizedBox(
              width: 40,
            ),
        itemCount: 10);
  }
}
