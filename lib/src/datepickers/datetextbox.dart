import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:flutter_ui_components/src/datepickers/datepicker.dart';

class DateTextBox extends StatelessWidget{
  final TextEditingController? controller;
  final String? labelText;
  final String? hint;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<DatePickerEntryMode>? onDatePickerModeChange;
  final void Function(DateTime selectedDate)? onDateSelected;

  DateTextBox({
    super.key,
    this.controller,
    this.labelText,
    this.hint,
    this.initialDate, this.firstDate, this.lastDate,
    this.onDatePickerModeChange,
    this.onDateSelected,
  });
  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      textFieldType: TextFieldType.NUMBER,
      labelText: labelText,
      hint: hint,
      suffix: AppDatePicker(onDateSelected: onDateSelected, firstDate: firstDate, lastDate: lastDate,),
    );
  }

}