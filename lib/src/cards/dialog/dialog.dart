import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget{
  final String title;
  final String content;
  final List<Widget>? actions;

  /// {@macro flutter.material.dialog.backgroundColor}
  final Color? backgroundColor;

  const AppDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: backgroundColor,
      title: Text(title, style: theme.textTheme.titleMedium,),
      content: Text(content, style: theme.textTheme.bodyMedium),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: actions,
    );
  }

}