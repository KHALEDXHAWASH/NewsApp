import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c14_online_sun/data/api_services/api_services.dart';
import 'package:news_app_c14_online_sun/data/repo_impl/search_repo_implementation.dart';
import 'package:news_app_c14_online_sun/data/search/search_implementation.dart';
import 'package:provider/provider.dart';

import '../../core/colors_manager.dart';
import '../../domain/entities/article_entity.dart';
import '../../providers/search_Provider.dart';
import '../home/sources_view/article.dart';

class SearchUI extends StatefulWidget {
  const SearchUI({super.key});

  @override
  State<SearchUI> createState() => _SearchUIState();
}

class _SearchUIState extends State<SearchUI> {
  late SearchProvider view;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    _initView();
    searchController = TextEditingController();
  }

  void _initView() {
    view = SearchProvider(
      search_repo_implementation(
        search_Implementation(ApiServices()),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: ChangeNotifierProvider<SearchProvider>(
            create: (context) => view,
            child: Column(
              children: [
                TextFormField(
                  controller: searchController,
                  onChanged: (value)
                  {
                    view.search(value);
                  },
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: ColorsManager.black17),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: ColorsManager.black17),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: ColorsManager.black17),
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),

                Consumer<SearchProvider>(
                  builder: (context, provider, child) {
                    if (provider.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (provider.errorMessage != null) {
                      return Center(child: Text(provider.errorMessage!));
                    }

                    if (provider.articles.isEmpty) {
                      return const Center(child: Text('No articles found'));
                    }

                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(height: 16.h),
                        itemBuilder: (context, index) {
                          final article = provider.articles[index];
                          return ArticleItem(
                            article: ArticleEntity(
                              author: article.author,
                              title: article.title,
                              description: article.description,
                              url: article.url,
                              urlToImage: article.urlToImage,
                              publishedAt: article.publishedAt,
                            ),
                          );
                        },
                        itemCount: provider.articles.length,
                      ),
                    );
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
