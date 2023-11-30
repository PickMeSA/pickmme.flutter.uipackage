import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../badges/notification_badge.dart';
import '../../constants/widgets.dart';

class AppExplorationTile extends StatelessWidget{
  final String title;
  final Icon? icon;
  final int? count;
  final bool active;
  final bool showNextIcon;
  final VoidCallback? onClick;
  const AppExplorationTile({
    super.key,
    required this.title,
    this.icon,
    this.count,
    this.active = false,
    this.showNextIcon = true,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    String countText = "";
    if(count!=null){
      countText = " ($count)";
    }
    return GestureDetector(
      onTap: onClick,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 5,
        shadowColor: Colors.black26,
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon ?? const Icon(Iconsax.briefcase),
              rowRegularSpacing,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(title + countText,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    if(count!=null && count!>0)rowRegularSpacing,
                    if(count!=null && count!>0)NotificationBadge.small(),
                  ],
                ),
              ),
              rowRegularSpacing,
              if(onClick!=null && showNextIcon)const Icon(Iconsax.arrow_right_1)
            ],
          ),
        ),
      ),
    );
  }

}