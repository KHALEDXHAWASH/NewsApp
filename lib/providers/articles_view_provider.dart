import 'package:flutter/material.dart';
import 'package:news_app_c14_online_sun/api_services/api_services.dart';
import 'package:news_app_c14_online_sun/models/articles_response/Article.dart';
import 'package:news_app_c14_online_sun/models/sources_response/Source.dart';

class ArticlesViewProvider extends ChangeNotifier{
  List<Article> articles = [];
  void loadArticles(Source source)async{
    articles = await ApiServices.getArticles(source);
    notifyListeners();
  }
}