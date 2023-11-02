import 'package:flutter/material.dart';

class AppImageAvatar extends StatelessWidget{
  final String defaultImage = "packages/flutter_ui_components/assets/profile.png";
  final String? assetName;
  final double width;
  final double height;
  final double assetHeight;

  const AppImageAvatar({
    super.key,
    this.assetName,
    this.width = 64,
    this.height = 64,
    this.assetHeight = 36,
  });

  factory AppImageAvatar.medium({required String assetName}){
    return AppImageAvatar(
      assetName: assetName,
      width: 56,
      height: 56,
    );
  }
  factory AppImageAvatar.small({required String assetName}){
    return AppImageAvatar(
      assetName: assetName,
      width: 48,
      height: 48,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFD1D4DB),
        ),
      ),
      child: Center(
        child: Container(
          height: assetHeight,
          width: assetHeight,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(assetName??defaultImage),fit: BoxFit.fill),
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );

  }


}