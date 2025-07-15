import 'package:evently/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
abstract class AppThemeManager{
  static ThemeData lightTheme=ThemeData(
    textTheme: GoogleFonts.interTextTheme().copyWith(
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,fontWeight: FontWeight.w500
         , color: ColorPallete.black
      ),

    ),
    primaryColor: Colors.white
  );

  static ThemeData darkTheme=ThemeData(
      primaryColor: ColorPallete.primaryColor,
    textTheme: GoogleFonts.interTextTheme().copyWith(
        bodyLarge: GoogleFonts.inter(
            fontSize: 16,fontWeight: FontWeight.w500
            , color: ColorPallete.primaryColor
        )
    ),
  );
}