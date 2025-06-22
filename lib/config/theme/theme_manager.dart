import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c14_online_sun/core/colors_manager.dart';

class ThemeManager
{
  static final ThemeData light = ThemeData(  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: ColorsManager.black17),
    backgroundColor: ColorsManager.white,
    foregroundColor: ColorsManager.black17,
    titleTextStyle: GoogleFonts.inter(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: ColorsManager.black17,
    ),
    centerTitle: true,
  ),
      scaffoldBackgroundColor: ColorsManager.white,
      tabBarTheme: TabBarThemeData(

        indicatorColor: ColorsManager.black17,
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,

        labelStyle: GoogleFonts.inter(fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManager.black17),
        unselectedLabelStyle: GoogleFonts.inter(fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.black17),
      ),
      textTheme: TextTheme(
        bodyMedium: GoogleFonts.inter(fontSize: 24.sp, fontWeight: FontWeight.w500, color: ColorsManager.white),          // labelMedium: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w500, color: ColorsManager.white),
        bodySmall: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: ColorsManager.black17,
        ),
        labelMedium: GoogleFonts.inter(
          fontSize: 16.sp,
          color: ColorsManager.black17,
          fontWeight: FontWeight.bold,
        ),
        titleSmall:GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: ColorsManager.black17,
        ),
      )
  );
  static final ThemeData dark = ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: ColorsManager.white),
      backgroundColor: ColorsManager.black17,
      foregroundColor: ColorsManager.white,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      centerTitle: true,
    ),
    scaffoldBackgroundColor: ColorsManager.black17,
    tabBarTheme: TabBarThemeData(

      indicatorColor: ColorsManager.white,
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.start,

      labelStyle: GoogleFonts.inter(fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: ColorsManager.white),
      unselectedLabelStyle: GoogleFonts.inter(fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.white),
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.inter(fontSize: 24.sp, fontWeight: FontWeight.w500, color: ColorsManager.white),
     labelMedium: GoogleFonts.inter(
       fontSize: 16.sp,
       color: ColorsManager.white,
       fontWeight: FontWeight.bold,
     ),
      bodySmall: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
      ),
        titleSmall:GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: ColorsManager.black17,
        ),
    )
  );
}
