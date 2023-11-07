import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/src/constants/colors.dart';

class ToggleOptions{
  final String title;
  final bool selected;

  ToggleOptions({required this.title, required this.selected});
}

class ProfileToggle extends StatelessWidget{
  // final TabController? tabController;
  // final List<Widget> tabContent;
  final bool vertical;
  final void Function(int index)? onPressed;
  final List<bool> selected;
  final List<Widget> children;
  final double borderWidth;

  const ProfileToggle({
    super.key,
    // required this.tabController,
    // required this.tabContent,
    required this.onPressed,
    this.vertical = false,
    required this.selected,
    required this.children,
    this.borderWidth =3 ,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: neutrals100Color,
      child: ToggleButtons(
        direction: vertical ? Axis.vertical : Axis.horizontal,
        onPressed: onPressed,
        borderWidth: borderWidth,
        constraints: const BoxConstraints(
          minHeight: 56.0,
          minWidth: 100,
        ),
        isSelected: selected,
        children: children,
      ),
    );
  }

}