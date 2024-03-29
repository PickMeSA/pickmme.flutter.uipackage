import 'dart:ui';

import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTheme{

  List<FontVariation> fontVariations = [
    FontVariation('wght', 400),
  ];
  TextStyle textStyle(Set<MaterialState> states){
    return const TextStyle( color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);
  }
  Color primaryButtonBackgroundColor(Set<MaterialState> states){
    if(states.contains(MaterialState.disabled)){
      return primaryDisabledColor;
    }
    return primaryColor;
  }
  BorderSide secondaryButtonOutlineColor(Set<MaterialState> states){
    if(states.contains(MaterialState.disabled)){
      return const BorderSide(color: primaryDisabledColor, width: 2);
    }
    return const BorderSide(color: primaryColor, width: 2);
  }
  Color primaryButtonForegroundColor(Set<MaterialState> states){
    return whiteColor;
  }

  Color primarySwitchBackgroundColor(Set<MaterialState> states){
    if(states.contains(MaterialState.selected)){
      return primaryColor;
    }
    if(states.contains(MaterialState.disabled)){
      return neutrals50Color;
    }
    return const Color(0xFFD1D4DB);
  }
  Color radioFillColor(Set<MaterialState> states){
    if(states.contains(MaterialState.selected)){
      return const Color(0xFFFFFFFF);
    }
    if(states.contains(MaterialState.disabled)){
      return neutrals50Color;
    }
    return const Color(0xFFD1D4DB);
  }
  Color radioOutlineColor(Set<MaterialState> states){
    if(states.contains(MaterialState.selected)){
      return primaryColor;
    }
    if(states.contains(MaterialState.disabled)){
      return neutrals50Color;
    }
    return const Color(0xFFD1D4DB);
  }
  Color primarySwitchThumbColor(Set<MaterialState> states){
    return const Color(0xFFFFFFFF);
  }

  Color tabOverlayColor(Set<MaterialState> states){
    // if(states.contains(MaterialState.focused)){
    //   return  Colors.blue;
    // }
    // if(states.contains(MaterialState.hovered)){
    //   return  whiteColor;
    // }
    return  Colors.blue;
  }

  get defaultTheme => ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: whiteColor,
      secondary: secondaryColor,
      onSecondary: whiteColor,
      error: errorColor,
      onError: whiteColor,
      background: whiteColor,
      onBackground: secondaryColor,
      surface: neutrals100Color,
      onSurface: secondaryColor,
    ),
    fontFamily: "Montserrat",

    typography: Typography.material2021(),
    chipTheme: const ChipThemeData(
      backgroundColor: neutrals100Color,
      side: BorderSide(color: Colors.transparent, width: 0),
      labelStyle: TextStyle(fontSize: 16, color: secondaryColor)
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: "Montserrat",
        fontVariations: fontVariations,
        fontWeight: FontWeight.w500,
        color: secondaryColor,
        fontSize: 24,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith(textStyle),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            // side: const BorderSide(color: primaryColor, width: 1),
          )
          ),
          backgroundColor: MaterialStateProperty.resolveWith(primaryButtonBackgroundColor),
          foregroundColor: MaterialStateProperty.resolveWith(primaryButtonForegroundColor),
          // padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12, horizontal: 16),),
          // shape: MaterialStateProperty.all(RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(5),
          // )),
          elevation: MaterialStateProperty.all(0),
        )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          // padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12, horizontal: 16)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
          textStyle: MaterialStateProperty.resolveWith(textStyle),
          side: MaterialStateProperty.resolveWith(secondaryButtonOutlineColor),
          foregroundColor: MaterialStateProperty.resolveWith(primaryButtonBackgroundColor),
        )
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
          textStyle: MaterialStateProperty.resolveWith(textStyle),
          foregroundColor: MaterialStateProperty.resolveWith(primaryButtonBackgroundColor),
        )
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Montserrat",
        fontVariations: fontVariations,
        fontWeight: FontWeight.w600,
        color: secondaryColor,
        fontSize: 32,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Montserrat",
        fontVariations: fontVariations,
        fontWeight: FontWeight.w500,
        color: secondaryColor,
        fontSize: 28,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Montserrat",
        fontVariations: fontVariations,
        fontWeight: FontWeight.w500,
        color: secondaryColor,
        fontSize: 24,
      ),
        titleLarge: TextStyle(
          fontFamily: "Montserrat",
          fontVariations: fontVariations,
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: secondaryColor,
          letterSpacing: 0.4,
      ),
        titleMedium: TextStyle(
          fontFamily: "Montserrat",
          fontVariations: fontVariations,
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: secondaryColor,
          letterSpacing: 0.4,
        ),
        titleSmall: TextStyle(
          fontFamily: "Montserrat",
          fontVariations: fontVariations,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: secondaryColor,
          letterSpacing: 0.4,
        ),
        bodyLarge: TextStyle(
          fontFamily: "Montserrat",
          color: secondaryColor,
          fontVariations: fontVariations,
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
        bodyMedium: TextStyle(
          fontFamily: "Montserrat",
          fontVariations: fontVariations,
          fontWeight: FontWeight.w400,
          color: secondaryColor,
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          fontFamily: "Montserrat",
          color: secondaryColor,
          fontSize: 12,
          height: 1.3,
          fontWeight: FontWeight.w400,
          fontVariations: fontVariations,
        ),
        labelLarge: const TextStyle(
          fontFamily: "Montserrat",
          color: neutrals500Color,
        ),
        labelMedium: TextStyle(
          fontFamily: "Montserrat",
          color: neutrals500Color,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontVariations: fontVariations,
        ),
        labelSmall: const TextStyle(
          fontFamily: "Montserrat",
          color: neutrals500Color,
        ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith(primarySwitchThumbColor),
      trackColor: MaterialStateProperty.resolveWith(primarySwitchBackgroundColor),
      trackOutlineColor: MaterialStateProperty.resolveWith(primarySwitchBackgroundColor),
      trackOutlineWidth:MaterialStateProperty.all(1),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith(radioOutlineColor),
      overlayColor: MaterialStateProperty.resolveWith(radioFillColor),
      splashRadius: 0,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      // visualDensity:,
    ),
    toggleButtonsTheme: const ToggleButtonsThemeData(
      fillColor: Color(0xFFFFFFFF),
      color: neutrals500Color,
      selectedColor: primaryColor,
      borderColor: neutrals100Color,
      selectedBorderColor: Color(0xFFF5F5F5),

    ),
    sliderTheme: const SliderThemeData(
      activeTrackColor: primaryColor,
      inactiveTrackColor: neutrals50Color,
      thumbColor: primaryColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        color: whiteColor,

        boxShadow: const [
          BoxShadow(
              color: Color(0xFFC8C8C8),
              offset: Offset.zero,
              blurRadius: 8.0,
             spreadRadius: 0.0
          ),
          BoxShadow(
              color: Color(0xFFFFFFFF),
              offset: Offset.zero,
              blurRadius: 8.0,
             spreadRadius: 0.0
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      )
    ),
    cardTheme: const CardTheme(
      color: whiteColor,
      surfaceTintColor: whiteColor
    ),
  );
}