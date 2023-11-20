import 'package:flutter/material.dart';

class TertiaryButtonDark extends StatelessWidget{
  /// Called when the button is tapped or otherwise activated.
  ///
  /// If this callback and [onLongPress] are null, then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onPressed;
  /// Typically the button's label.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;
  final double? width;
  final double height;
  final double? elevation;

  final Color? color;

  /// Called when the button is long-pressed.
  ///
  /// If this callback and [onPressed] are null, then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onLongPress;

  /// Called when a pointer enters or exits the button response area.
  ///
  /// The value passed to the callback is true if a pointer has entered this
  /// part of the material and false if a pointer has exited this part of the
  /// material.
  final ValueChanged<bool>? onHover;

  /// Handler called when the focus changes.
  ///
  /// Called with true if this widget's node gains focus, and false if it loses
  /// focus.
  final ValueChanged<bool>? onFocusChange;

  /// Customizes this button's appearance.
  ///
  /// Non-null properties of this style override the corresponding
  /// properties in [themeStyleOf] and [defaultStyleOf]. [MaterialStateProperty]s
  /// that resolve to non-null values will similarly override the corresponding
  /// [MaterialStateProperty]s in [themeStyleOf] and [defaultStyleOf].
  ///
  /// Null by default.
  final ButtonStyle? style;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none], and must not be null.
  final Clip clipBehavior;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.material.inkwell.statesController}
  final MaterialStatesController? statesController;

  /// Determine whether this subtree represents a button.
  ///
  /// If this is null, the screen reader will not announce "button" when this
  /// is focused. This is useful for [MenuItemButton] and [SubmenuButton] when we
  /// traverse the menu system.
  ///
  /// Defaults to true.
  final bool? isSemanticButton;
  final bool fullWidth;

  double? getElevation(Set<MaterialState> states) => elevation;

  const TertiaryButtonDark({
    super.key,
    required this.onPressed,
    this.onLongPress,
    required this.child,
    this.width,
    this.height = 56,
    this.elevation = 0,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.statesController,
    this.isSemanticButton,
    this.fullWidth = false,
    this.color,
  });

  factory TertiaryButtonDark.fullWidth({
    required VoidCallback? onPressed,
    required Widget child,
    VoidCallback? onLongPress,
    double height = 56,
    ButtonStyle? style,
    double elevation = 0,
  }){
    return TertiaryButtonDark(
      onPressed: onPressed,
      onLongPress: onLongPress,
      height: height,
      style: style,
      elevation: elevation,
      fullWidth: true,
      child: child,
    );
  }

  factory TertiaryButtonDark.small ({
    required VoidCallback? onPressed,
    required Widget child,
    VoidCallback? onLongPress,
    double width = 155,
    double height = 32,
    ButtonStyle? style,
    double elevation = 0,
  }){
    return TertiaryButtonDark(
      onPressed: onPressed,
      onLongPress: onLongPress,
      width: width,
      height: height,
      style: style,
      elevation: elevation,
      fullWidth: false,
      child: child,
    );
  }

  factory TertiaryButtonDark.icon({
    required VoidCallback? onPressed,
    required Icon child,
    VoidCallback? onLongPress,
    double width = 56,
    double height = 56,
    ButtonStyle? style,
    double elevation = 0,
  }){
    return TertiaryButtonDark(
      onPressed: onPressed,
      onLongPress: onLongPress,
      width: width,
      height: height,
      style: style,
      elevation: elevation,
      fullWidth: false,
      child: child,
    );
  }

  factory TertiaryButtonDark.smallIcon({
    required VoidCallback? onPressed,
    required Icon child,
    VoidCallback? onLongPress,
    double width = 40,
    double height = 40,
    ButtonStyle? style,
    double elevation = 0,
  }){
    return TertiaryButtonDark(
      onPressed: onPressed,
      onLongPress: onLongPress,
      width: width,
      height: height,
      style: style,
      elevation: elevation,
      fullWidth: false,
      child: child,
    );
  }

  foreground(Set<MaterialState> states, ThemeData theme){
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
        foregroundColor: MaterialStateProperty.resolveWith((states) => foreground(states, theme)),
      );
    }
    if(height == 56){
      return ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12, horizontal: 16)),
        foregroundColor: MaterialStateProperty.resolveWith((states) => foreground(states, theme)),
      );

    }else if(height == 40){
      return ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
        foregroundColor: MaterialStateProperty.resolveWith((states) => foreground(states, theme)),
      );
    }else if(height == 32){
      return ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 8, horizontal: 24)),
        foregroundColor: MaterialStateProperty.resolveWith((states) => foreground(states, theme)),
      );
    }
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith((states) => foreground(states, theme)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(!fullWidth) {
      return SizedBox(
        height: height,
        width: width,
        child: TextButton(
            onPressed: onPressed,
            onLongPress: onLongPress,
            style: style??defaultStyle(context),
            child: child
        ),
      );
    }
    return TextButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style??defaultStyle(context),
        child: child
    );
  }
}