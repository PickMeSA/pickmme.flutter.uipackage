import 'package:flutter/material.dart';

class AppTheme{
  final Color primaryColor = Color(0xFF3EB62B);
  final Color secondaryColor = Color(0xFF111828);
  TextStyle textStyle(Set<MaterialState> states){
    return const TextStyle( color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);
  }
  Color primaryButtonBackgroundColor(Set<MaterialState> states){
    if(states.contains(MaterialState.disabled)){
      return const Color(0xFFC5E9BF);
    }
    return primaryColor;
  }
  BorderSide secondaryButtonOutlineColor(Set<MaterialState> states){
    if(states.contains(MaterialState.disabled)){
      return const BorderSide(color: Color(0xFFC5E9BF, ), width: 2);
    }
    return BorderSide(color: primaryColor, width: 2);
  }
  Color primaryButtonForegroundColor(Set<MaterialState> states){
    return Colors.white;
  }

  Color primarySwitchBackgroundColor(Set<MaterialState> states){
    if(states.contains(MaterialState.selected)){
      return primaryColor;
    }
    if(states.contains(MaterialState.disabled)){
      return const Color(0xFFE6E7EB);
    }
    return const Color(0xFFD1D4DB);
  }
  Color radioFillColor(Set<MaterialState> states){
    if(states.contains(MaterialState.selected)){
      return const Color(0xFFFFFFFF);
    }
    if(states.contains(MaterialState.disabled)){
      return const Color(0xFFE6E7EB);
    }
    return const Color(0xFFD1D4DB);
  }
  Color radioOutlineColor(Set<MaterialState> states){
    if(states.contains(MaterialState.selected)){
      return primaryColor;
    }
    if(states.contains(MaterialState.disabled)){
      return const Color(0xFFE6E7EB);
    }
    return const Color(0xFFD1D4DB);
  }
  Color primarySwitchThumbColor(Set<MaterialState> states){
    return const Color(0xFFFFFFFF);
  }

  get defaultTheme => ThemeData(
    fontFamily: "Montserrat",
    primaryColor: Color(0xFF3EB62B),
    chipTheme: ChipThemeData(
      backgroundColor: Color(0xFFF9F9F9),
      side: BorderSide(color: Colors.transparent, width: 0),
      labelStyle: TextStyle(fontSize: 16, color: secondaryColor)
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith(textStyle),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Color(0xFF3EB62B), width: 1),
          )
          ),
          backgroundColor: MaterialStateProperty.resolveWith(primaryButtonBackgroundColor),
          foregroundColor: MaterialStateProperty.resolveWith(primaryButtonForegroundColor),

        )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith(textStyle),
          side: MaterialStateProperty.resolveWith(secondaryButtonOutlineColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                side: BorderSide(
                    style: BorderStyle.solid,
                    color: Color(0xFF3EB62B),
                    width: 1), // <-- this doesn't work at all in shape.
              )),
          foregroundColor: MaterialStateProperty.resolveWith(primaryButtonBackgroundColor),
        )
    ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Colors.black
        ),
        bodySmall: TextStyle(
            color: Colors.black
        )
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
      color: Color(0xFF6B7380),
      selectedColor: Color(0xFF3EB62B),
      borderColor: const Color(0xFFF9F9F9),
      selectedBorderColor: const Color(0xFFF5F5F5),

    ),
    sliderTheme: const SliderThemeData(
      activeTrackColor: Color(0xFF3EB62B),
      inactiveTrackColor: Color(0xFFE6E7EB),
      thumbColor: Color(0xFF3EB62B),
    ),
    inputDecorationTheme: InputDecorationTheme(

      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF3EB62B)),
    useMaterial3: true,
  );
}