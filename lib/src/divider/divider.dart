import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double thickness;
  final double height;
  final double indent;
  final double endIndent;
  final Color? color;
  const AppDivider({
    super.key,
    this.thickness = 1.5,
    this.height = 10,
    this.indent = 0,
    this.endIndent = 0,
    this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color?? const Color(0xFFE6E7EB),
    );
  }
}