import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c14_online_sun/data/models/category_model.dart';
import 'package:news_app_c14_online_sun/providers/home_provider.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
 final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return InkWell(
      onTap: () {
        homeProvider.changHomeViewToSources(category);
      },
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(category.imagePath)),
        ],
      ),
    );
  }
}
