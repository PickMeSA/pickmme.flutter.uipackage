import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppSquareImageAvatar extends StatelessWidget{
  final Widget? image;
  final IconData? icon;
  final double width;
  final double height;
  final double assetHeight;
  final Color color;

  const AppSquareImageAvatar({
    super.key,
    this.image,
    this.icon,
    this.width = 115,
    this.height = 115,
    this.assetHeight = 115,
    required this.color,
  });

  factory AppSquareImageAvatar.medium({Widget? image, IconData? icon, Color color = neutrals200Color}){
    return AppSquareImageAvatar(
      image: image,
      icon: icon,
      width: 56,
      height: 56,
      color: color,
    );
  }
  factory AppSquareImageAvatar.small({Widget? image, IconData? icon, Color color = neutrals200Color}){
    return AppSquareImageAvatar(
      image: image,
      icon: icon,
      width: 48,
      height: 48,
      color: color,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: neutrals100Color,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Builder(
        builder: (context) {
          if(image==null){
            return Center(
              //Iconsax profile is broken so using material design here
              child: Icon(icon??Icons.account_circle, color: color),
            );
          }
          return Center(
            child: Container(
              height: assetHeight,
              width: assetHeight,
              decoration: const BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
              ),
              child: image!,
            ),
          );
        }
      ),
    );

  }


}