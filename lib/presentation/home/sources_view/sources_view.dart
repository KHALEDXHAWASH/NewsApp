import 'package:flutter/material.dart';
import 'package:news_app_c14_online_sun/core/widgets/error_state_widget.dart';
import 'package:news_app_c14_online_sun/data/api_services/api_services.dart';
import 'package:news_app_c14_online_sun/data/datasource_impl/articles_api_datasource.dart';
import 'package:news_app_c14_online_sun/data/datasource_impl/sources_api_datasource.dart';
import 'package:news_app_c14_online_sun/data/models/category_model.dart';
import 'package:news_app_c14_online_sun/data/repo_impl/articles_repo.dart';
import 'package:news_app_c14_online_sun/data/repo_impl/sources_repository.dart';
import 'package:news_app_c14_online_sun/domain/usecases/get_articles_usecase.dart';
import 'package:news_app_c14_online_sun/domain/usecases/get_sources_usecase.dart';

import 'package:news_app_c14_online_sun/presentation/home/sources_view/article.dart';
import 'package:news_app_c14_online_sun/providers/articles_viewModel.dart';
import 'package:news_app_c14_online_sun/providers/sources_viewModel.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  SourcesView({super.key, required this.category});

  final CategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesViewModel sourcesViewModel;
  late ArticlesViewModel articlesViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    sourcesViewModel = SourcesViewModel(
      sourcesUseCase: GetSourcesUseCase(
        repository: SourcesRepositoryImpl(
          dataSource: SourcesApiDataSourceImpl(apiServices: ApiServices()),
        ),
      ),
    );
    articlesViewModel = ArticlesViewModel(
      articlesUseCase: GetArticlesUseCase(
        repository: ArticlesRepositoryImpl(
          dataSource: ArticlesApiDataSourceImpl(apiServices: ApiServices()),
        ),
      ),
    );
    await sourcesViewModel.loadSources(widget.category); // blocking
    articlesViewModel.loadArticles(
      (sourcesViewModel.state as SourcesSuccessState).sources[0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: sourcesViewModel),
        ChangeNotifierProvider.value(value: articlesViewModel),
      ],
      child: Column(
        children: [
          Consumer<SourcesViewModel>(
            builder: (context, viewModel, child) {
              var state = viewModel.state;
              switch (state) {
                case SourcesSuccessState():
                  {
                    return DefaultTabController(
                      length: state.sources.length,
                      child: TabBar(
                        onTap: (index) {
                          articlesViewModel.loadArticles(
                            (sourcesViewModel.state as SourcesSuccessState)
                                .sources[index],
                          );
                        },
                        isScrollable: true,
                        tabs:
                            state.sources
                                .map((e) => Tab(text: e.name))
                                .toList(),
                      ),
                    );
                  }

                case SourcesLoadingState():
                  return Center(child: CircularProgressIndicator());

                case SourcesErrorState():
                  return ErrorStateWidget(
                    serverError: state.serverError,
                    exception: state.exception,
                  );
              }
            },
          ),
          Consumer<ArticlesViewModel>(
            builder: (context, viewModel, child) {
              var state = viewModel.state;

              switch (state) {
                case ArticlesSuccessState():
                  {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder:
                            (context, index) =>
                                ArticleItem(article: state.articles[index]),
                        itemCount: state.articles.length,
                      ),
                    );
                  }

                case ArticlesLoadingState():
                  return Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                case ArticlesErrorState():
                  {
                    return ErrorStateWidget(
                      serverError: state.serverError,
                      exception: state.exception,
                    );
                  }
              }
            },
          ),
        ],
      ),
    );
  }
}
