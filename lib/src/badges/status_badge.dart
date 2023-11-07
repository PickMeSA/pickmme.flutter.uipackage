import 'package:flutter/material.dart';
import 'package:flutter_ui_components/src/constants/colors.dart';

enum BadgeStatuses {Success, Alert, Warning, Info}
class StatusBadge extends StatelessWidget{
  final BadgeStatuses status;
  final String message;
  final Color color;

  const StatusBadge({
    super.key,
    required this.status,
    required this.message, 
    required this.color,
  });
  factory StatusBadge.success(String message){
    return StatusBadge(status: BadgeStatuses.Success, message: message, color: primaryColor);
  }
  factory StatusBadge.warning(String message){
    return StatusBadge(status: BadgeStatuses.Warning, message: message, color: warningColor);
  }
  factory StatusBadge.danger(String message){
    return StatusBadge(status: BadgeStatuses.Alert, message: message, color: dangerColor);
  }
  factory StatusBadge.info(String message){
    return StatusBadge(status: BadgeStatuses.Info, message: message, color: infoColor);
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: InputChip(
        label: Text(message, style: TextStyle(color: color),),
        color: MaterialStateProperty.all(color.withOpacity(0.1)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          // <-- this doesn't work at all in shape.
        ),
        onSelected: (bool val){},
      ),
    );
  }

}