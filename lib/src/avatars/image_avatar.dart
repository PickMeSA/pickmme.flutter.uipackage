import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppImageAvatar extends StatelessWidget{
  final Widget? image;
  final double width;
  final double height;
  final double assetHeight;

  const AppImageAvatar({
    super.key,
    this.image,
    this.width = 64,
    this.height = 64,
    this.assetHeight = 64,
  });

  factory AppImageAvatar.medium({Widget? image}){
    return AppImageAvatar(
      image: image,
      width: 56,
      height: 56,
    );
  }
  factory AppImageAvatar.small({Widget? image}){
    return AppImageAvatar(
      image: image,
      width: 48,
      height: 48,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFD1D4DB),
        ),
      ),
      child: Builder(
        builder: (context) {
          if(image==null){
            return const Center(
              //Iconsax profile is broken so using material design here
              child: Icon(Icons.account_circle, color: Color(0xFFD1D4DB,)),
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