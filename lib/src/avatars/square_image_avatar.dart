import 'package:flutter/material.dart';

class AppSquareImageAvatar extends StatelessWidget{
  final Widget? image;
  final double width;
  final double height;
  final double assetHeight;

  const AppSquareImageAvatar({
    super.key,
    this.image,
    this.width = 115,
    this.height = 115,
    this.assetHeight = 115,
  });

  factory AppSquareImageAvatar.medium({Widget? image}){
    return AppSquareImageAvatar(
      image: image,
      width: 56,
      height: 56,
    );
  }
  factory AppSquareImageAvatar.small({Widget? image}){
    return AppSquareImageAvatar(
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
      decoration: const BoxDecoration(
        color: Color(0xFFF9F9F9),
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
                color: Colors.white,
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