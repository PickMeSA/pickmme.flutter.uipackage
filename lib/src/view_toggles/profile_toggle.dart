import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      color: const Color(0xFFF9F9F9),
      child: ToggleButtons(
        direction: vertical ? Axis.vertical : Axis.horizontal,
        onPressed: onPressed,
        borderWidth: borderWidth,
        // borderRadius: const BorderRadius.all(Radius.circular(8)),
        // borderColor: const Color(0xFFF9F9F9),
        // selectedBorderColor: const Color(0xFFF9F9F9),
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