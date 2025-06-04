import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c14_online_sun/core/assets_manager.dart';
import 'package:news_app_c14_online_sun/core/colors_manager.dart';
import 'package:news_app_c14_online_sun/models/article_model.dart';
import 'package:news_app_c14_online_sun/models/articles_response/Article.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Container(),
        );
      },
      child: Container(
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorsManager.white, width: 1.w),
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: article.urlToImage ?? '',
              progressIndicatorBuilder:
                  (context, url, downloadProgress) => CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 10.h),
            Text(
              article.title ?? '',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                color: ColorsManager.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.author ?? '',
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: ColorsManager.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  article.publishedAt ?? '',
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: ColorsManager.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
