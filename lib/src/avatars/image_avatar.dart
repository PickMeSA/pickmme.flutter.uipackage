import 'package:flutter/material.dart';

import '../badges/notification_badge.dart';
import '../constants/colors.dart';

class AppImageAvatar extends StatelessWidget{
  final ImageProvider? image;
  final double width;
  final double height;
  final double assetHeight;
  final bool active;

  const AppImageAvatar({
    super.key,
    this.image,
    this.width = 64,
    this.height = 64,
    this.assetHeight = 64,
    this.active = false,
  });

  factory AppImageAvatar.medium({ImageProvider? image, bool active=false}){
    return AppImageAvatar(
      image: image,
      width: 56,
      height: 56,
      active: active,
    );
  }
  factory AppImageAvatar.small({ImageProvider? image, bool active=false}){
    return AppImageAvatar(
      image: image,
      width: 48,
      height: 48,
      active: active,
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
          return Stack(
            children: [
              Center(
                child: Container(
                  height: assetHeight,
                  width: assetHeight,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: image!,
                        fit: BoxFit.cover,
                    )
                  ),
                ),
              ),
              if(active)Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: NotificationBadge.small(),
                  )
              )
            ],
          );
        }
      ),
    );

  }


}