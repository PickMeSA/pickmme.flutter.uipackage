import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

class AppCenteredDivider extends StatelessWidget {
  final String text;

  const AppCenteredDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: neutrals200Color,
              height: 1.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(text),
          ),
          const Expanded(
            child: Divider(
              color: neutrals200Color,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}