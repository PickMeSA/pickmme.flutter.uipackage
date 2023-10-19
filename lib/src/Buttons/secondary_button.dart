import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget{
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget child;
  final double? width;
  final double? height;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final bool inheritParentWidth;

  EdgeInsetsGeometry? getPadding(Set<MaterialState> states) => padding;
  double? getElevation(Set<MaterialState> states) => elevation;

  const SecondaryButton({
    super.key,
    required this.onPressed,
    this.onLongPress,
    required this.child,
    this.width = 326,
    this.height = 56,
    this.padding = EdgeInsets.zero,
    this.elevation = 0,
    this.inheritParentWidth = false,
  });

  factory SecondaryButton.halfWidth({
    required VoidCallback? onPressed,
    required Widget child,
    VoidCallback? onLongPress,
    double width = 155,
    double height = 56,
    padding = EdgeInsets.zero,
    double elevation = 0,
  }){
    return SecondaryButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      width: width,
      height: height,
      padding: padding,
      elevation: elevation,
      child: child,
    );
  }

  factory SecondaryButton.small ({
    required VoidCallback? onPressed,
    required Widget child,
    VoidCallback? onLongPress,
    double width = 155,
    double height = 32,
    padding = EdgeInsets.zero,
    double elevation = 0,
  }){
    return SecondaryButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      width: width,
      height: height,
      padding: padding,
      elevation: elevation,
      child: child,
    );
  }

  factory SecondaryButton.icon({
    required VoidCallback? onPressed,
    required Icon child,
    VoidCallback? onLongPress,
    double width = 56,
    double height = 56,
    padding = EdgeInsets.zero,
    double elevation = 0,
  }){
    return SecondaryButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      width: width,
      height: height,
      padding: padding,
      elevation: elevation,
      child: child,
    );
  }

  factory SecondaryButton.smallIcon({
    required VoidCallback? onPressed,
    required Icon child,
    VoidCallback? onLongPress,
    double width = 40,
    double height = 40,
    padding = EdgeInsets.zero,
    double elevation = 0,
  }){
    return SecondaryButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      width: width,
      height: height,
      padding: padding,
      elevation: elevation,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: inheritParentWidth?null:width,
      height: height,
      child: OutlinedButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: ButtonStyle(
              padding: MaterialStateProperty.resolveWith(getPadding,),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
              elevation: MaterialStateProperty.resolveWith(getElevation)
          ),
          child: child
      ),
    );
  }
}