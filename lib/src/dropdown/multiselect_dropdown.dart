import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

class AppMultiSelectDropdownMenu<T> extends StatelessWidget {
  final TextEditingController? controller;
  final bool enableFilter;
  final bool filled;
  final Widget? leadingIcon;
  final Widget? label;
  final double? width;
  final bool dropdownIsValid;
  final List<DropdownMenuItem<T>> dropdownMenuEntries;
  /// The callback is called when a selection is made.
  ///
  /// Defaults to null. If null, only the text field is updated.
  final ValueChanged<T?>? onChanged;
  final ValueChanged<String>? onSearch;
  final EdgeInsetsGeometry? contentPadding;

  const AppMultiSelectDropdownMenu({
    super.key,
    this.controller,
    required this.enableFilter,
    this.leadingIcon,
    this.label,
    this.width,
    this.dropdownIsValid = true,
    required this.dropdownMenuEntries,
    required this.onChanged,
    required this.onSearch,
    this.filled = false, this.contentPadding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: dropdownIsValid ? secondaryColor : Theme.of(context).colorScheme.error,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            isExpanded: true,
            icon: leadingIcon,
            hint: label,
            value: null,
            items:dropdownMenuEntries,
            onChanged: onChanged,
          )
      ),
    );
  }
}