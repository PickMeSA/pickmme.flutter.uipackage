import 'package:flutter/material.dart';

class AppMultiSelectDropdownMenu<T> extends StatelessWidget {
  final TextEditingController? controller;
  final bool enableFilter;
  final bool filled;
  final Widget? leadingIcon;
  final Widget? label;
  final double? width;
  final List<DropdownMenuItem<T>> dropdownMenuEntries;
  /// The callback is called when a selection is made.
  ///
  /// Defaults to null. If null, only the text field is updated.
  final ValueChanged<T?>? onChanged;
  final EdgeInsetsGeometry? contentPadding;

  const AppMultiSelectDropdownMenu({
    super.key,
    this.controller,
    required this.enableFilter,
    this.leadingIcon,
    this.label,
    this.width,
    required this.dropdownMenuEntries,
    required this.onChanged,
    this.filled = false, this.contentPadding
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<T>(
          isExpanded: true,
        icon: leadingIcon,
    hint: label,
        value: null,
        items:dropdownMenuEntries,
        onChanged: onChanged,
        //
      //     controller: controller,
      //     enableFilter: enableFilter,
      //     leadingIcon: leadingIcon,
      // label: label,
      // width: width??MediaQuery.of(context).size.width,
      // dropdownMenuEntries: dropdownMenuEntries,
      // inputDecorationTheme: InputDecorationTheme(
      // filled: filled,
      // contentPadding: contentPadding,
      // ),
      // onSelected: onSelected),
    )
    );
  }
}