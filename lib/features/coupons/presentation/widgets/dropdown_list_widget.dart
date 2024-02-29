import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class DropDownWidget extends StatefulWidget {
  final List<String> items;
  const DropDownWidget({super.key, required this.items});
  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  late String dropdownValue;
  @override
  void initState() {
    super.initState();
    dropdownValue = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppTheme.of(context).spaces.space_700,
          width: 350,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppTheme.of(context).spaces.space_200),
            child: DropdownButton<String>(
              value: dropdownValue,
              isExpanded: true,
              icon: const Icon(Icons.chevron_right_rounded),
              style: const TextStyle(color: Colors.black),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
