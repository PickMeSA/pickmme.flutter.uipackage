import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
class RadioOption extends Equatable{
  final String title;
  final value;

  const RadioOption({required this.title, required this.value});

  @override
  List<Object?> get props => [value];
}

class RadioButtonList extends StatelessWidget {
  final ValueChanged? onChanged;
  final List<RadioOption> options;
  final selected;
  final Widget? secondary;
  final ListTileControlAffinity controlAffinity;
  final double itemHeight;

  const RadioButtonList({super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
    this.secondary,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.itemHeight = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight*options.length,
      child: ListView.builder(
          itemCount: options.length,
          itemBuilder: (BuildContext context, int index) {
            return RadioListTile(
              title: Text(options[index].title),
              secondary: secondary,
              value: options[index],
              groupValue: selected,
              onChanged: onChanged,
              controlAffinity: controlAffinity,
            );
          }
      ),
    );
  }
}