import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/data/models/articles_response/ArticleDM.dart';
import 'package:news_app_c14_online_sun/data/search/search.dart';

import '../api_services/api_services.dart';

class search_Implementation extends searchDS
{
  final ApiServices _apiService;

  search_Implementation(this._apiService);
  @override
  Future<Result<List<Article>>> searchquery(String query) async{
    // TODO: implement searchquery
  return await _apiService.search(query);
  }
  
}