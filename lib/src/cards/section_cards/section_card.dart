import 'package:flutter/material.dart';

class AppSectionCard extends StatelessWidget{
  final Icon? icon;
  final String title;
  final VoidCallback? onClick;
  final Color? color;
  final double width;
  final double height;

  const AppSectionCard({
    super.key,
    required this.title,
    this.icon,
    this.onClick,
    this.color,
    this.width = 155,
    this.height = 192,
  });

  factory AppSectionCard.small({
    required  String title,
    Icon? icon,
    VoidCallback? onClick,
    Color? color,
  }){
    return AppSectionCard(
      title: title,
      icon: icon,
      onClick: onClick,
      color: color,
      width: 155,
      height: 155,);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        color: color??const Color(0xFFF9F9F9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (icon==null)?const SizedBox():
              Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: icon!,
                  )
              ),
              Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: color==null?null:Colors.white,
                fontWeight: FontWeight.w400,
              ),),
            ],
          ),
          ),
        ),
      ),
    );
  }

}