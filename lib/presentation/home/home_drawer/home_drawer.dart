import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c14_online_sun/core/colors_manager.dart';
import 'package:news_app_c14_online_sun/core/extensions/context_extension.dart';
import 'package:news_app_c14_online_sun/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Drawer(
      backgroundColor: ColorsManager.black17,
      width: context.width * 0.7,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 166.h,
            color: ColorsManager.white,
            child: Text(
              "News-App",
              style: GoogleFonts.inter(
                fontSize: 22.sp,
                color: ColorsManager.black17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    homeProvider.changeViewToCategories();
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.home, color: ColorsManager.white),
                      SizedBox(width: 8.w),
                      Text(
                        "Go To Home",
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          color: ColorsManager.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Divider(color: ColorsManager.white, thickness: 1),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dark",
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        color: ColorsManager.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Switch(value: true, onChanged: (value) {},),
                  ],
                ),
                SizedBox(height: 24.h),
                Divider(color: ColorsManager.white,thickness: 1,),
                SizedBox(height: 24.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "English",
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        color: ColorsManager.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Switch(value: true, onChanged: (value) {},),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
