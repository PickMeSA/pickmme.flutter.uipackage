import 'package:flutter/material.dart';

class PrimaryButtonDark extends StatelessWidget{
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

  const PrimaryButtonDark({
    super.key,
    required this.onPressed,
    this.onLongPress,
    required this.child,
    this.height = 56,
    this.padding,
    this.elevation = 0,
    this.width,
    this.fullWidth = false,
    this.style,
  });

  factory PrimaryButtonDark.fullWidth({
    required VoidCallback? onPressed,
    required Widget child,
    VoidCallback? onLongPress,
    double height = 56,
    padding = EdgeInsets.zero,
    double elevation = 0,
    ButtonStyle? style,
  }){
    return PrimaryButtonDark(
      onPressed: onPressed,
      onLongPress: onLongPress,
      width: null,
      height: height,
      padding: padding,
      elevation: elevation,
      fullWidth: true,
      style: style,
      child: child,
    );
  }

  factory PrimaryButtonDark.small ({
    required VoidCallback? onPressed,
    required Widget child,
    VoidCallback? onLongPress,
    double width = 155,
    double height = 32,
    padding = EdgeInsets.zero,
    ButtonStyle? style,
    double elevation = 0,
  }){
    return PrimaryButtonDark(
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

  factory PrimaryButtonDark.icon({
    required VoidCallback? onPressed,
    required Icon child,
    VoidCallback? onLongPress,
    double width = 56,
    double height = 56,
    padding = EdgeInsets.zero,
    ButtonStyle? style,
    double elevation = 0,
  }){
    return PrimaryButtonDark(
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

  factory PrimaryButtonDark.smallIcon({
    required VoidCallback? onPressed,
    required Icon child,
    VoidCallback? onLongPress,
    double width = 40,
    double height = 40,
    padding = EdgeInsets.zero,
    ButtonStyle? style,
    double elevation = 0,
  }){
    return PrimaryButtonDark(
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
  border(Set<MaterialState> states, ThemeData theme){
    return BorderSide(
      color: states.contains(MaterialState.disabled)?
      theme.colorScheme.secondary.withOpacity(0):
      theme.colorScheme.secondary,
      width: 2,
    );
  }

  background(Set<MaterialState> states, ThemeData theme){
    return states.contains(MaterialState.disabled)?
    theme.colorScheme.secondary.withOpacity(0.3):
    theme.colorScheme.secondary;
  }

  ButtonStyle defaultStyle(BuildContext context){
    ThemeData theme = Theme.of(context);
    if(fullWidth){
      return ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size.fromHeight(56)),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 14, horizontal: 18)),
        backgroundColor: MaterialStateProperty.resolveWith((states) => background(states, theme)),
        side: MaterialStateProperty.resolveWith((states) => border(states, theme)),
      );
    }
    if(height == 56){
      return ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12, horizontal: 16)),
        backgroundColor: MaterialStateProperty.resolveWith((states) => background(states, theme)),
        side: MaterialStateProperty.resolveWith((states) => border(states, theme)),
      );

    }else if(height == 40){
      return ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
        backgroundColor: MaterialStateProperty.resolveWith((states) => background(states, theme)),
        side: MaterialStateProperty.resolveWith((states) => border(states, theme)),
      );
    }else if(height == 32){
      return ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 8, horizontal: 24)),
        backgroundColor: MaterialStateProperty.resolveWith((states) => background(states, theme)),
        side: MaterialStateProperty.resolveWith((states) => border(states, theme)),
      );
    }
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) => background(states, theme)),
      side: MaterialStateProperty.resolveWith((states) => border(states, theme)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(!fullWidth) {
      return SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
            onPressed: onPressed,
            onLongPress: onLongPress,
            style: style??defaultStyle(context),
            child: child
        ),
      );
    }
    return ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style??defaultStyle(context),
        child: child
    );
  }
}