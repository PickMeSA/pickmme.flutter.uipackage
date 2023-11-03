import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget{
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget child;
  final double? width;
  final double height;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final bool fullWidth;
  EdgeInsetsGeometry? getPadding(Set<MaterialState> states) => padding;
  double? getElevation(Set<MaterialState> states) => elevation;
  final ButtonStyle? style;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.onLongPress,
    required this.child,
    this.height = 56,
    this.padding,
    this.elevation = 0,
    this.width,
    this.fullWidth = true,
    this.style,
  });

  factory PrimaryButton.halfWidth({
    required VoidCallback? onPressed,
    required Widget child,
    VoidCallback? onLongPress,
    double? width,
    double height = 56,
    padding = EdgeInsets.zero,
    double elevation = 0,
    ButtonStyle? style,
  }){
    return PrimaryButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      width: width,
      height: height,
      padding: padding,
      elevation: elevation,
      fullWidth: false,
      style: style,
      child: child,
    );
  }

  factory PrimaryButton.small ({
    required VoidCallback? onPressed,
    required Widget child,
    VoidCallback? onLongPress,
    double width = 155,
    double height = 32,
    padding = EdgeInsets.zero,
    ButtonStyle? style,
    double elevation = 0,
  }){
    return PrimaryButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      width: width,
      height: height,
      padding: padding,
      elevation: elevation,
      fullWidth: false,
      style: style,
      child: child,
    );
  }

  factory PrimaryButton.icon({
    required VoidCallback? onPressed,
    required Icon child,
    VoidCallback? onLongPress,
    double width = 56,
    double height = 56,
    padding = EdgeInsets.zero,
    ButtonStyle? style,
    double elevation = 0,
  }){
    return PrimaryButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      width: width,
      height: height,
      padding: padding,
      elevation: elevation,
      fullWidth: false,
      style: style,
      child: child,
    );
  }

  factory PrimaryButton.smallIcon({
    required VoidCallback? onPressed,
    required Icon child,
    VoidCallback? onLongPress,
    double width = 40,
    double height = 40,
    padding = EdgeInsets.zero,
    ButtonStyle? style,
    double elevation = 0,
  }){
    return PrimaryButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      width: width,
      height: height,
      padding: padding,
      elevation: elevation,
      fullWidth: false,
      style: style,
      child: child,
    );
  }

  ButtonStyle defaultStyle(){
    if(fullWidth){
      return ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size.fromHeight(56)),
      );
    }
    return const ButtonStyle();
  }

  @override
  Widget build(BuildContext context) {
    if(!fullWidth) {
      return SizedBox(
        height: height,
        child: ElevatedButton(
            onPressed: onPressed,
            onLongPress: onLongPress,
            style: style??defaultStyle(),
            child: child
        ),
      );
    }
    return ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style??defaultStyle(),
        child: child
    );
  }
}