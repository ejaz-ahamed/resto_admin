import 'package:flutter/material.dart';

class Timepiker extends StatefulWidget {
  const Timepiker({super.key});

  @override
  State<Timepiker> createState() => _TimepikerState();
}

class _TimepikerState extends State<Timepiker> {
  TimeOfDay selectedtime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          final TimeOfDay? timeOfDay = await showTimePicker(
              context: context,
              initialTime: selectedtime,
              initialEntryMode: TimePickerEntryMode.dial);
          if (timeOfDay != null) {
            setState(() {
              selectedtime = timeOfDay;
            });
          }
        },
        child: Text(
            "${selectedtime.hour}:${selectedtime.minute}:${selectedtime.period}"));
  }
}
