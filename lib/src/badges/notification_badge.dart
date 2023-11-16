import 'package:flutter/material.dart';

import '../constants/colors.dart';

class NotificationBadge extends StatelessWidget{

  final int? count;
  final double? width;
  final double? height;

  const NotificationBadge({
    super.key,
    this.count,
    this.width = 22,
    this.height = 22,
  });
  factory NotificationBadge.small(){
    return const NotificationBadge(
      width: 8,
      height: 8,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width,
      width: height,
      child: Badge(
        backgroundColor: primaryColor,
        label: count==null?null:Text(
          count.toString(),
          style: const TextStyle(color: whiteColor),
        ),

      ),
    );
  }

}