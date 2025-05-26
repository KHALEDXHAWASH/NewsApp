import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c14_online_sun/core/colors_manager.dart';

class ThemeManager {
  static final ThemeData light = ThemeData();
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
      bodyMedium: GoogleFonts.inter(fontSize: 24.sp, fontWeight: FontWeight.w500, color: ColorsManager.white)
    )
  );
}
