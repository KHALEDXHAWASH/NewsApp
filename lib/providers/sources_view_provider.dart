import 'package:flutter/material.dart';
import 'package:news_app_c14_online_sun/api_services/api_services.dart';
import 'package:news_app_c14_online_sun/models/articles_response/Article.dart';
import 'package:news_app_c14_online_sun/models/category_model.dart';
import 'package:news_app_c14_online_sun/models/sources_response/Source.dart';

class SourcesViewProvider extends ChangeNotifier{
  List<Source> sources = [];



  Future<void> loadSources(CategoryModel category)async{
    sources =await  ApiServices.getSources(category);
    notifyListeners();
  }


}