import 'package:flutter/material.dart';

class AppTimePicker extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return const TimePickerDialog(
      initialTime: TimeOfDay(hour: 10, minute: 0),
      initialEntryMode: TimePickerEntryMode.inputOnly,
    );
  }

}