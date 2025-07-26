import 'package:evently/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemeManager{
  static ThemeData lightTheme=ThemeData(
      primaryColor: ColorPallete.primaryColor,
      scaffoldBackgroundColor: ColorPallete.screenLight,
      textTheme: GoogleFonts.interTextTheme().copyWith(
        bodySmall: GoogleFonts.inter(fontWeight: FontWeight.bold
            ,fontSize: 12.sp,color: ColorPallete.screenLight),
        bodyMedium: GoogleFonts.inter(fontWeight: FontWeight.bold
            ,fontSize: 14.sp,color: ColorPallete.black),
        bodyLarge: GoogleFonts.inter(fontWeight: FontWeight.bold
            ,fontSize: 16.sp,color: ColorPallete.black),
        headlineSmall: GoogleFonts.inter(fontWeight: FontWeight.w500
            ,fontSize: 20.sp,color: ColorPallete.white),
      ),
      hintColor: ColorPallete.grey,
      highlightColor: ColorPallete.grey,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorPallete.screenLight,

      )


  );

  static ThemeData darkTheme=ThemeData(
      primaryColor: ColorPallete.primaryColor,
      scaffoldBackgroundColor: ColorPallete.screenDark,
      textTheme: GoogleFonts.interTextTheme().copyWith(
        bodySmall: GoogleFonts.inter(fontWeight: FontWeight.bold
            ,fontSize: 12,color: ColorPallete.white),
        bodyMedium: GoogleFonts.inter(fontWeight: FontWeight.bold
            ,fontSize: 14,color: ColorPallete.white),
        bodyLarge: GoogleFonts.inter(fontWeight: FontWeight.bold
            ,fontSize: 16,color: ColorPallete.white),
        headlineSmall: GoogleFonts.inter(fontWeight: FontWeight.bold
            ,fontSize: 20,color: ColorPallete.white),
      ),
      hintColor: ColorPallete.white,
      highlightColor: ColorPallete.white,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorPallete.screenDark,)
      );
}
