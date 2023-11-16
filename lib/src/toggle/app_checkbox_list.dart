import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
class CheckboxOption extends Equatable{
  final String title;
  final bool checked;

  const CheckboxOption({required this.title, required this.checked});

  @override
  List<Object?> get props => [checked];
}

class CheckboxList extends StatelessWidget {
  final ValueChanged? onChanged;
  final List<CheckboxOption> options;
  final selected;
  final Widget? secondary;
  final ListTileControlAffinity controlAffinity;
  final double itemHeight;

  const CheckboxList({super.key,
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
        padding: EdgeInsets.zero,
        itemCount: options.length,
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            title: Text(options[index].title),
            value: options[index].checked,
            controlAffinity: controlAffinity,
            onChanged: onChanged,
            secondary: secondary,
          );
        },
      ),
    );
  }
}