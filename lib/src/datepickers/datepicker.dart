import 'package:flutter/material.dart';
import '../extensions/date.dart';

class DatePicker extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return InputDatePickerFormField(
        initialDate:DateTime.now(),
      firstDate: DateTime.now().addYears(numberOfYears:-100),
      lastDate: DateTime.now().addYears(numberOfYears:100),
    );
  }

}