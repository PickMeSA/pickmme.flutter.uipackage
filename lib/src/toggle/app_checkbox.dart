import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget{
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const AppCheckbox({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.8,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
      ),
    );
  }

}