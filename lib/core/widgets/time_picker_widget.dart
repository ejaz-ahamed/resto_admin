import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay selectedtime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () async {
              final TimeOfDay? timeOfDay = await showTimePicker(
                  context: context, initialTime: selectedtime);
              if (timeOfDay != null) {
                setState(() {
                  selectedtime = timeOfDay;
                });
              }
            },
            child: Text("${selectedtime.hour}:${selectedtime.minute}"))
      ],
    );
  }
}
