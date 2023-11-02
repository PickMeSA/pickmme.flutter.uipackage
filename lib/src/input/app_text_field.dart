import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/enums.dart';
import '../extensions/widget.dart';
import '../extensions/bool.dart';
import '../extensions/string.dart';
import '../extensions/numbers.dart';
import '../theme/decorations.dart';

/// Default Text Form Field
class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextFieldType textFieldType;

  final InputDecoration? decoration;
  final FocusNode? focus;
  final FormFieldValidator<String>? validator;
  final bool? isPassword;
  final bool? isValidationRequired;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final FocusNode? nextFocus;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final bool? autoFocus;
  final bool? readOnly;
  final bool? enableSuggestions;
  final int? maxLength;
  final Color? cursorColor;
  final Widget? suffix;
  final Color? suffixIconColor;
  final TextInputType? keyboardType;
  final Iterable<String>? autoFillHints;
  final EdgeInsets? scrollPadding;
  final double? cursorWidth;
  final double? cursorHeight;
  final Function()? onTap;
  final InputCounterWidgetBuilder? buildCounter;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlignVertical? textAlignVertical;
  final bool? expands;
  final bool? showCursor;
  final TextSelectionControls? selectionControls;
  final StrutStyle? strutStyle;
  final String? obscuringCharacter;
  final String? initialValue;
  final Brightness? keyboardAppearance;
  final Widget? suffixPasswordVisibleWidget;
  final Widget? suffixPasswordInvisibleWidget;
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  final String? errorThisFieldRequired;
  final String? errorInvalidEmail;
  final String? errorMinimumPasswordLength;
  final String? errorInvalidURL;
  final String? errorInvalidUsername;

  final String? title;
  final TextStyle? titleTextStyle;
  final int? spacingBetweenTitleAndTextFormField;
  final Icon? prefixIcon;
  final String? hint;
  final String? labelText;
  final Color? bgColor;
  final Color? borderColor;
  final EdgeInsets? padding;
  bool isPasswordVisible = false;
  final Color secondaryColor = const Color(0xFF111828);
  final Color errorColor = const Color(0xFFF44F4E);
  
  AppTextField({
    this.controller,
    required this.textFieldType,
    this.decoration,
    this.focus,
    this.validator,
    this.isPassword,
    this.buildCounter,
    this.isValidationRequired,
    this.textCapitalization,
    this.textInputAction,
    this.onFieldSubmitted,
    this.nextFocus,
    this.textStyle,
    this.textAlign,
    this.maxLines,
    this.minLines,
    this.enabled,
    this.onChanged,
    this.cursorColor,
    this.suffix,
    this.suffixIconColor,
    this.enableSuggestions,
    this.autoFocus,
    this.readOnly,
    this.maxLength,
    this.keyboardType,
    this.autoFillHints,
    this.scrollPadding,
    this.onTap,
    this.cursorWidth,
    this.cursorHeight,
    this.inputFormatters,
    this.errorThisFieldRequired,
    this.errorInvalidEmail,
    this.errorMinimumPasswordLength,
    this.errorInvalidURL,
    this.errorInvalidUsername,
    this.textAlignVertical,
    this.expands,
    this.showCursor,
    this.selectionControls,
    this.strutStyle,
    this.obscuringCharacter,
    this.initialValue,
    this.keyboardAppearance,
    this.suffixPasswordVisibleWidget,
    this.suffixPasswordInvisibleWidget,
    this.contextMenuBuilder,
    this.title,
    this.titleTextStyle,
    this.spacingBetweenTitleAndTextFormField = 4,
    this.prefixIcon,
    this.hint,
    this.bgColor,
    this.borderColor,
    this.padding,
    this.labelText,
    Key? key,
  }) : super(key: key);
  Widget? suffixIcon(BuildContext context) {
    if (textFieldType == TextFieldType.PASSWORD) {
      if (suffix != null) {
        return suffix;
      } else {
        if (isPasswordVisible) {
          if (suffixPasswordVisibleWidget != null) {
            return suffixPasswordVisibleWidget!.onTap(() {
              onPasswordVisibilityChange(false);
            });
          } else {
            return Icon(
              Icons.visibility,
              color:
              suffixIconColor ?? Theme.of(context).iconTheme.color,
            ).onTap(() {
              onPasswordVisibilityChange(false);
            });
          }
        } else {
          if (suffixPasswordInvisibleWidget != null) {
            return suffixPasswordInvisibleWidget!.onTap(() {
              onPasswordVisibilityChange(true);
            });
          } else {
            return Icon(
              Icons.visibility_off,
              color:
              suffixIconColor ?? Theme.of(context).iconTheme.color,
            ).onTap(() {
              onPasswordVisibilityChange(true);
            });
          }
        }
      }
    } else {
      return suffix;
    }
  }

  TextInputType? applyTextInputType() {
    if (keyboardType != null) {
      return keyboardType;
    } else if (textFieldType == TextFieldType.EMAIL ||
        textFieldType == TextFieldType.EMAIL_ENHANCED) {
      return TextInputType.emailAddress;
    } else if (textFieldType == TextFieldType.MULTILINE) {
      return TextInputType.multiline;
    } else if (textFieldType == TextFieldType.PASSWORD) {
      return TextInputType.visiblePassword;
    } else if (textFieldType == TextFieldType.PHONE ||
        textFieldType == TextFieldType.NUMBER) {
      return TextInputType.number;
    } else if (textFieldType == TextFieldType.URL) {
      return TextInputType.url;
    } else {
      return TextInputType.text;
    }
  }

  Iterable<String>? applyAutofillHints() {
    if (textFieldType == TextFieldType.EMAIL ||
        textFieldType == TextFieldType.EMAIL_ENHANCED) {
      return [AutofillHints.email];
    } else if (textFieldType == TextFieldType.PASSWORD) {
      return [AutofillHints.password];
    }
    return null;
  }
  void onPasswordVisibilityChange(bool val) {
    isPasswordVisible = val;
  }

  TextCapitalization applyTextCapitalization() {
    if (textCapitalization != null) {
      return textCapitalization!;
    } else if (textFieldType == TextFieldType.NAME) {
      return TextCapitalization.words;
    } else if (textFieldType == TextFieldType.MULTILINE) {
      return TextCapitalization.sentences;
    } else {
      return TextCapitalization.none;
    }
  }

  InputDecoration appInputDecoration(BuildContext context, {Icon? prefixIcon, String? hint, String? labelText, Color? bgColor, Color? borderColor, EdgeInsets? padding}) {
    return InputDecoration(
      contentPadding: padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      counter: const Offstage(),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
      enabledBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: secondaryColor),),
      errorBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: errorColor),),
      fillColor: Colors.white,
      // hintText: hint,
      labelText: labelText,
      prefixIcon: prefixIcon,
      filled: true,
      suffixIcon: suffixIcon(context),
    );
  }
  Widget textFormFieldWidget(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText:
      textFieldType == TextFieldType.PASSWORD && !isPasswordVisible,
      textCapitalization: applyTextCapitalization(),
      textInputAction: applyTextInputAction(),
      keyboardType: applyTextInputType(),
      decoration: appInputDecoration(context,
          prefixIcon: prefixIcon,
          hint: hint,
          bgColor: bgColor??Colors.white,
          borderColor: borderColor??secondaryColor,
          padding: padding,
          labelText: labelText
      ),
      focusNode: focus,
      style: textStyle,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines.validate(
          value: textFieldType == TextFieldType.MULTILINE ? 10 : 1),
      minLines: minLines.validate(
          value: textFieldType == TextFieldType.MULTILINE ? 2 : 1),
      autofocus: autoFocus ?? false,
      enabled: enabled,
      onChanged: onChanged,
      cursorColor: cursorColor ??
          Theme.of(context).textSelectionTheme.cursorColor,
      readOnly: readOnly.validate(),
      maxLength: maxLength,
      enableSuggestions: enableSuggestions.validate(value: true),
      autofillHints: autoFillHints ?? applyAutofillHints(),
      scrollPadding: scrollPadding ?? const EdgeInsets.all(20),
      cursorWidth: cursorWidth.validate(value: 2.0),
      cursorHeight: cursorHeight,
      cursorRadius: radiusCircular(4),
      onTap: onTap,
      buildCounter: buildCounter,
      scrollPhysics: const BouncingScrollPhysics(),
      enableInteractiveSelection: true,
      inputFormatters: inputFormatters,
      textAlignVertical: textAlignVertical,
      expands: expands.validate(),
      showCursor: showCursor,
      selectionControls:
      selectionControls ?? MaterialTextSelectionControls(),
      strutStyle: strutStyle,
      obscuringCharacter: obscuringCharacter.validate(value: '•'),
      keyboardAppearance: keyboardAppearance,
      contextMenuBuilder: contextMenuBuilder,
    );
  }
  TextInputAction? applyTextInputAction() {
    if (textInputAction != null) {
      return textInputAction;
    } else if (textFieldType == TextFieldType.MULTILINE) {
      return TextInputAction.newline;
    } else if (nextFocus != null) {
      return TextInputAction.next;
    } else {
      return TextInputAction.done;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (title.validate().isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: textStyle,
          ),
          spacingBetweenTitleAndTextFormField.height,
          textFormFieldWidget(context),
        ],
      );
    }

    return textFormFieldWidget(context);
  }
}
