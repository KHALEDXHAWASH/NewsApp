import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c14_online_sun/api_services/api_services.dart';
import 'package:news_app_c14_online_sun/core/assets_manager.dart';
import 'package:news_app_c14_online_sun/core/colors_manager.dart';
import 'package:news_app_c14_online_sun/models/article_model.dart';
import 'package:news_app_c14_online_sun/models/articles_response/Article.dart';
import 'package:news_app_c14_online_sun/models/category_model.dart';
import 'package:news_app_c14_online_sun/models/source_model.dart';
import 'package:news_app_c14_online_sun/models/sources_response/Source.dart';
import 'package:news_app_c14_online_sun/presentation/home/sources_view/article.dart';
import 'package:news_app_c14_online_sun/providers/articles_view_provider.dart';
import 'package:news_app_c14_online_sun/providers/sources_view_provider.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  SourcesView({super.key, required this.category});

  final CategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesViewProvider sourcesViewProvider;
  late ArticlesViewProvider articlesViewProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    sourcesViewProvider = SourcesViewProvider();
    articlesViewProvider = ArticlesViewProvider();
    await sourcesViewProvider.loadSources(widget.category); // blocking
    articlesViewProvider.loadArticles(sourcesViewProvider.sources[0]);
  }

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     DefaultTabController(
    //       length: 10,
    //       child: TabBar(
    //         isScrollable: true,
    //         tabs: sources.map((source) => Tab(text: source.name)).toList(),
    //       ),
    //     ),
    //     SizedBox(height: 16.h,),
    //     Expanded(
    //       child: ListView.separated(
    //         separatorBuilder: (context, index) => SizedBox(height: 16.h),
    //         itemBuilder:
    //             (context, index) => ArticleItem(article: articles[index]),
    //         itemCount: articles.length,
    //       ),
    //     ),
    //   ],
    // );
    // return FutureBuilder(
    //   future: ApiServices.getSources(category),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     if (snapshot.hasError) {
    //       return Text("error");
    //     }
    //     List<Source> sources = snapshot.data ?? [];
    //     return DefaultTabController(
    //       length: sources.length,
    //       child: TabBar(
    //         isScrollable: true,
    //         tabs: sources.map((source) => Tab(text: source.name)).toList(),
    //       ),
    //     );
    //   },
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: sourcesViewProvider),
        ChangeNotifierProvider.value(value: articlesViewProvider),
      ],
      child: Column(
        children: [
          Consumer<SourcesViewProvider>(
            builder: (context, sourcesViewProvider, child) {
              print("Build Sources now.....");
              List<Source> sources = sourcesViewProvider.sources;
              return DefaultTabController(
                length: sources.length,
                child: TabBar(
                  onTap: (index) {
                    articlesViewProvider.loadArticles(
                      sourcesViewProvider.sources[index],
                    );
                  },
                  isScrollable: true,
                  tabs:
                      sources.map((source) => Tab(text: source.name)).toList(),
                ),
              );
            },
          ),
          Consumer<ArticlesViewProvider>(
            builder: (context, articlesViewProvider, child) {
              print("Build articles now.....");
              List<Article> articles = articlesViewProvider.articles;
              return Expanded(
                child: ListView.builder(
                  itemBuilder:
                      (context, index) => ArticleItem(article: articles[index]),
                  itemCount: articles.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
