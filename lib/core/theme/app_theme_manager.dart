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
        titleLarge: GoogleFonts.inter(fontWeight: FontWeight.bold
            ,fontSize: 24.sp,color: ColorPallete.white),
      ),
      hintColor: ColorPallete.grey,
      highlightColor: ColorPallete.textColorInDark,

      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: ColorPallete.primaryColor
        ),

        backgroundColor: ColorPallete.screenLight,

      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
        backgroundColor: ColorPallete.primaryColor,
        selectedIconTheme: IconThemeData(
          color: ColorPallete.white,
       ),
        selectedItemColor: ColorPallete.white,
        selectedLabelStyle: TextStyle(
            color: ColorPallete.white,
            fontWeight: FontWeight.bold,
            fontSize: 12
        ),
        unselectedIconTheme: IconThemeData(
            color: ColorPallete.textColorInDark
        ),
        unselectedLabelStyle: TextStyle(
            color: ColorPallete.white,
            fontSize: 12,
            fontWeight: FontWeight.bold
        ),
        unselectedItemColor: ColorPallete.white
    ),


  );

  static ThemeData darkTheme=ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorPallete.screenDark,
      selectedIconTheme: IconThemeData(
        color: ColorPallete.white,
      ),
      selectedItemColor: ColorPallete.white,
      selectedLabelStyle: TextStyle(
        color: ColorPallete.white,
        fontWeight: FontWeight.bold,
        fontSize: 12
      ),
      unselectedIconTheme: IconThemeData(
        color: ColorPallete.textColorInDark
      ),
      unselectedLabelStyle: TextStyle(
        color: ColorPallete.white,
        fontSize: 12,
        fontWeight: FontWeight.bold
      ),
      unselectedItemColor: ColorPallete.white
    ),
      iconTheme: IconThemeData(
          color:ColorPallete.textColorInDark
      ),
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
      hintColor: ColorPallete.textColorInDark,
      highlightColor: ColorPallete.textColorInDark,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorPallete.screenDark,)
      );
}
