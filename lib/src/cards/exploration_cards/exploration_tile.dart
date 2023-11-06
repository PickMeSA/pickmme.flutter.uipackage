import 'package:flutter/material.dart';
import '../../badges/notification_badge.dart';
import '../../extensions/numbers.dart';
import 'package:iconsax/iconsax.dart';

class AppExplorationTile extends StatelessWidget{
  final String title;
  final Icon? icon;
  final int? count;
  final bool active;
  final VoidCallback? onClick;
  const AppExplorationTile({
    super.key,
    required this.title,
    this.icon,
    this.count,
    this.active = false,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    String countText = "";
    if(count!=null){
      countText = " ($count)";
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon ?? const Icon(Iconsax.briefcase),
            10.width,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title + countText,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  if(count!=null && count!>0)10.width,
                  if(count!=null && count!>0)NotificationBadge.small(),
                ],
              ),
            ),
            10.width,
            if(onClick!=null)const Icon(Iconsax.arrow_right_1)
          ],
        ),
      ),
    );
  }

}