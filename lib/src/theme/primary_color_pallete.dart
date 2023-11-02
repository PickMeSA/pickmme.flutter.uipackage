import 'package:flutter/material.dart';

const MaterialColor pickme = MaterialColor(_pickmePrimaryValue, <int, Color>{
  50: Color(0xFFE8F6E6),
  100: Color(0xFFC5E9BF),
  200: Color(0xFF9FDB95),
  300: Color(0xFF78CC6B),
  400: Color(0xFF5BC14B),
  500: Color(_pickmePrimaryValue),
  600: Color(0xFF38AF26),
  700: Color(0xFF30A620),
  800: Color(0xFF289E1A),
  900: Color(0xFF1B8E10),
});
const int _pickmePrimaryValue = 0xFF3EB62B;
const MaterialColor pickmeAccent = MaterialColor(_pickmeAccentValue, <int, Color>{
  100: Color(0xFFC4FFC0),
  200: Color(_pickmeAccentValue),
  400: Color(0xFF65FF5A),
  700: Color(0xFF4DFF41),
});
const int _pickmeAccentValue = 0xFF95FF8D;