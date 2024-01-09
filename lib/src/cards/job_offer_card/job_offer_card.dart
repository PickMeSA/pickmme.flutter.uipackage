import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../badges/notification_badge.dart';
import '../../constants/widgets.dart';

class AppOfferJobCard extends StatelessWidget{
  final String text;
  final VoidCallback onTap;
  final bool selected;
  const AppOfferJobCard({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity, // Takes full width of its parent
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3.0,
              spreadRadius: 1.0,
              offset: Offset(0, 4),
            ),
          ],
          border: selected
              ? Border.all(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          )
              : null,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 48),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }

}