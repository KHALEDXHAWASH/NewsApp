import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c14_online_sun/data/models/articles_response/ArticleDM.dart';

import '../data/api_services/result.dart';
import '../domain/repository_contract/search_repo.dart';
class SearchProvider extends ChangeNotifier {
  final search_repo _searchRepo;
  bool isLoading = false;
  String? errorMessage;
  List<Article> articles = [];

  SearchProvider(this._searchRepo);

  Future<void> search(String query) async {
    articles=[];
    if(query.isEmpty){
      articles=[];

      notifyListeners();
      return;
    }
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _searchRepo.search(query);

    switch (result) {
      case Success<List<Article>>():
        isLoading = false;
        articles = result.data;
        errorMessage = null;
        notifyListeners();
      case ServerError<List<Article>>():
        isLoading = false;
        articles = [];
        errorMessage = result.message;
        notifyListeners();
      case GeneralEx<List<Article>>():
        isLoading = false;
        articles = [];
        errorMessage = result.exception.toString();
        notifyListeners();
    }
  }
}