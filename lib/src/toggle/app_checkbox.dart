import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget{
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const AppCheckbox({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 2,
      child: Checkbox(
        side: MaterialStateBorderSide.resolveWith(
            (Set<MaterialState> states) => BorderSide(
              color: states.contains(MaterialState.selected)?
              Theme.of(context).colorScheme.primary:
              Theme.of(context).colorScheme.secondary,
              width: 0.7,
            ),
        ),
        value: value,
        onChanged: onChanged,
      ),
    );
  }

}