import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class Swichbutton extends StatefulWidget {
  const Swichbutton({super.key});

  @override
  State<Swichbutton> createState() => _SwichbuttonState();
}

class _SwichbuttonState extends State<Swichbutton> {
  bool isswiched = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Switch(
        activeColor: AppTheme.of(context).colors.primary,
        inactiveThumbColor: AppTheme.of(context).colors.secondary,
        value: isswiched,
        onChanged: (value) {
          setState(() {
            isswiched = value;
          });
        },
      ),
    );
  }
}
