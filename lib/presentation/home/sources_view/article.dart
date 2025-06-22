import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c14_online_sun/core/colors_manager.dart';
import 'package:news_app_c14_online_sun/domain/entities/article_entity.dart';
import 'package:url_launcher/url_launcher.dart';



class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});

  final ArticleEntity article;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => Container(
            padding: EdgeInsets.all(16.r),
           // margin: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                
                 
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CachedNetworkImage(
                        imageUrl: article.urlToImage ?? '',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                    
                      ),
                  ),
                Text(article.title??" ",style: Theme.of(context).textTheme.titleSmall,),
                ElevatedButton(onPressed: (){
               _UrlLauncher(article.url!);
                  print(article.url??" ");
                }, style: ElevatedButton.styleFrom(backgroundColor:ColorsManager.black17,foregroundColor :ColorsManager.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))), child: Text("View Full article",style: Theme.of(context).textTheme.bodyMedium,)
                )
                
              ],

            ),



          ),
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
              style:   Theme.of(context).textTheme.labelMedium
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

void _UrlLauncher(String url)
async{
  Uri uri =Uri.parse(url);
  if(await canLaunchUrl(uri))
  {
    await launchUrl(uri);
  }

}
