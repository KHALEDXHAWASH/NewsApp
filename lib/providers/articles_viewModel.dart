import 'package:flutter/material.dart';
import 'package:news_app_c14_online_sun/data/api_services/api_services.dart';
import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/data/models/articles_response/Article.dart';
import 'package:news_app_c14_online_sun/data/models/sources_response/Source.dart';
import 'package:news_app_c14_online_sun/domain/entities/article_entity.dart';
import 'package:news_app_c14_online_sun/domain/entities/source_entity.dart';
import 'package:news_app_c14_online_sun/domain/repository_contract/articles_repository.dart';
import 'package:news_app_c14_online_sun/domain/usecases/get_articles_usecase.dart';

class ArticlesViewModel extends ChangeNotifier {
  ArticlesViewModelState state = ArticlesLoadingState();
  GetArticlesUseCase articlesUseCase;
  ArticlesViewModel({required this.articlesUseCase});


  void emit(ArticlesViewModelState newState) {
    state = newState;
    notifyListeners();
  }

  void loadArticles(SourceEntity sourceEntity) async {
    emit(ArticlesLoadingState());
    var result = await articlesUseCase.invoke(sourceEntity);
    switch (result) {
      case Success<List<ArticleEntity>>():
        emit(ArticlesSuccessState(articles: result.data));
      case ServerError<List<ArticleEntity>>():
        emit(ArticlesErrorState(serverError: result));
      case GeneralEx<List<ArticleEntity>>():
        emit(ArticlesErrorState(exception: result.exception));
    }
  }
}

sealed class ArticlesViewModelState {}

class ArticlesSuccessState extends ArticlesViewModelState {
  List<ArticleEntity> articles;

  ArticlesSuccessState({required this.articles});
}

class ArticlesLoadingState extends ArticlesViewModelState {
  String? loadingMsg;

  ArticlesLoadingState({this.loadingMsg});
}

class ArticlesErrorState extends ArticlesViewModelState {
  ServerError? serverError;
  Exception? exception;

  ArticlesErrorState({this.serverError, this.exception});
}
