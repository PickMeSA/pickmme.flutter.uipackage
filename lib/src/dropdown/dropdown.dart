import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppDropdownMenu<T> extends StatelessWidget {
  final TextEditingController? controller;
  final bool enableFilter;
  final bool filled;
  final Widget? leadingIcon;
  final Widget? label;
  final double? width;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  /// The callback is called when a selection is made.
  ///
  /// Defaults to null. If null, only the text field is updated.
  final ValueChanged<T?>? onSelected;
  final EdgeInsetsGeometry? contentPadding;

  const AppDropdownMenu({
    super.key,
    this.controller,
    required this.enableFilter,
    this.leadingIcon,
    this.label,
    this.width,
    required this.dropdownMenuEntries,
    this.onSelected,
    this.filled = false, this.contentPadding
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
        controller: controller,
        enableFilter: enableFilter,
        leadingIcon: leadingIcon,
        textStyle: const TextStyle(
          color: secondaryColor,
          overflow: TextOverflow.ellipsis

        ),
    label: label,
    width: width??MediaQuery.of(context).size.width - 50,
    dropdownMenuEntries: dropdownMenuEntries,
    inputDecorationTheme: InputDecorationTheme(
    filled: filled,
    contentPadding: contentPadding,
    ),
    onSelected: onSelected);
  }
}