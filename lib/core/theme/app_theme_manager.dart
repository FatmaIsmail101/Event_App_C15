import 'package:evently/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';

abstract class AppThemeManager{
  static ThemeData lightTheme=ThemeData(
    primaryColor: Colors.white
  );

  static ThemeData darkTheme=ThemeData(
      primaryColor: ColorPallete.primaryColor
  );
}