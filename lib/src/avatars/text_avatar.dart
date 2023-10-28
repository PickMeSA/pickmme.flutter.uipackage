import 'package:flutter/material.dart';

class AppTextAvatar extends StatelessWidget{
  final String text;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;

  const AppTextAvatar({
    super.key,
    required this.text,
    this.width = 64,
    this.height = 64,
    this.fontSize = 18,
    this.fontWeight = FontWeight.bold
  });

  factory AppTextAvatar.medium({required String text}){
    return AppTextAvatar(
      text: text,
      width: 56,
      height: 56,
      fontSize: 16,
    );
  }
  factory AppTextAvatar.small({required String text}){
    return AppTextAvatar(
      text: text,
      width: 48,
      height: 48,
      fontSize: 14,
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
      child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: const Color(0xFF151619),
              fontSize: fontSize,
              fontWeight: fontWeight
            ),
          )
      ),
    );
  }


}