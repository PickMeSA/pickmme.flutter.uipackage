import 'package:flutter/material.dart';
import 'primary_color_pallete.dart';
class AppTheme{
  final BuildContext context;
  final Color primaryColor = const Color(0xFF3EB62B);
  final Color secondaryColor = const Color(0xFF111828);

  AppTheme({required this.context});

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

  Color tabOverlayColor(Set<MaterialState> states){
    // if(states.contains(MaterialState.focused)){
    //   return  Colors.blue;
    // }
    // if(states.contains(MaterialState.hovered)){
    //   return  Colors.white;
    // }
    return  Colors.blue;
  }

  get defaultTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: secondaryColor,
      onSecondary: Colors.white,
      error: const Color(0xFFF44F4E),
      onError: Colors.white,
      background: Colors.white,
      onBackground: secondaryColor,
      surface: Colors.white,
      onSurface: secondaryColor,
    ),
    fontFamily: "Montserrat",
    typography: Typography.material2021(),
    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFFF9F9F9),
      side: const BorderSide(color: Colors.transparent, width: 0),
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
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith(textStyle),
          foregroundColor: MaterialStateProperty.resolveWith(primaryButtonBackgroundColor),
        )
    ),
    textTheme: TextTheme(
      headlineLarge: Theme.of(context).textTheme.headlineLarge!.copyWith(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
        fontSize: 32,
      ),
      headlineMedium: Theme.of(context).textTheme.headlineLarge!.copyWith(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w500,
        fontSize: 28,
      ),
      headlineSmall: Theme.of(context).textTheme.headlineLarge!.copyWith(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w500,
        fontSize: 24,
      ),
        titleLarge: Theme.of(context).textTheme.headlineLarge!.copyWith(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          fontSize: 18,
          letterSpacing: 0.4,
      ),
        titleMedium: Theme.of(context).textTheme.headlineLarge!.copyWith(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          fontSize: 18,
          letterSpacing: 0.4,
        ),
        titleSmall: Theme.of(context).textTheme.headlineLarge!.copyWith(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: 0.4,
        ),
        bodyLarge: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontFamily: "Montserrat",
          fontSize: 18,
        ),
        bodyMedium: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: "Montserrat",
          fontSize: 16,
        ),
        bodySmall: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w300,
          fontSize: 14,
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
    inputDecorationTheme: const InputDecorationTheme(

      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        color: Colors.white,

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

  );
}