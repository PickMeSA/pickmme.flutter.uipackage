import 'package:flutter/material.dart';

class PrimarySwitch extends StatelessWidget {
  final void Function(bool)? onChanged;
  final bool value;
  const PrimarySwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: value,
      onChanged: onChanged,
    );
  }
}
