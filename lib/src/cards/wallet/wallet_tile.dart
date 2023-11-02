import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppWalletTile extends StatelessWidget{
  final Icon? icon;
  final String title;
  final VoidCallback? onClick;
  final Color? color;
  final String amount;
  final double height;

  const AppWalletTile({
    super.key,
    required this.title,
    required this.amount,
    this.icon,
    this.onClick,
    this.color,
    this.height = 96,
  });

  factory AppWalletTile.small({
    required  String title,
    required  String amount,
    Icon? icon,
    VoidCallback? onClick,
    Color? color,
  }){
    return AppWalletTile(
      title: title,
      amount: amount,
      icon: icon,
      onClick: onClick,
      color: color,
      height: 155,);
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: color??const Color(0xFFF9F9F9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: const Color(0xFF9CA2AE),
                      ),
                    ),
                    Text(amount,
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: const Color(0xFF111828),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: onClick,
                  child: Icon(Iconsax.arrow_right_1, color: theme.colorScheme.secondary,))
            ],
          ),
        ),
      ),
    );
  }

}