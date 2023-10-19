import 'package:flutter/material.dart';

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
    return StatusBadge(status: BadgeStatuses.Success, message: message, color: const Color(0xFF3EB62B));
  }
  factory StatusBadge.warning(String message){
    return StatusBadge(status: BadgeStatuses.Warning, message: message, color: const Color(0xFFF17E2C));
  }
  factory StatusBadge.danger(String message){
    return StatusBadge(status: BadgeStatuses.Alert, message: message, color: const Color(0xFFF44F4E));
  }
  factory StatusBadge.info(String message){
    return StatusBadge(status: BadgeStatuses.Info, message: message, color: const Color(0xFF23A8B3));
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