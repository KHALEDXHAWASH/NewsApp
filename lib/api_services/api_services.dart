import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c14_online_sun/models/articles_response/Article.dart';
import 'package:news_app_c14_online_sun/models/articles_response/ArticlesResponse.dart';
import 'package:news_app_c14_online_sun/models/category_model.dart';
import 'package:news_app_c14_online_sun/models/sources_response/Source.dart';
import 'package:news_app_c14_online_sun/models/sources_response/SourcesResponse.dart';

class ApiServices {
  static const String _baseUrl = "newsapi.org";
  static const String _apiKey = "79eae4e1d59f42219904c1e4a146ab74";
  static const String _sourcesEndPoint = "/v2/top-headlines/sources";
  static const String _articlesEndPoint = "/v2/everything";

  static Future<List<Source>> getSources(CategoryModel category) async {
    Uri url = Uri.https(_baseUrl, _sourcesEndPoint, {
      "apiKey": _apiKey,
      "category": category.id,
    });

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse.sources!;
  }

  static Future<List<Article>>getArticles(Source source)async {
    ///https://newsapi.org/v2/everything?q=bitcoin&apiKey=79eae4e1d59f42219904c1e4a146ab74
  Uri url =   Uri.https(_baseUrl, _articlesEndPoint, {
      "apiKey": _apiKey,
      "sources": source.id,
    });
   http.Response response = await  http.get(url);
   var json = jsonDecode(response.body);
   ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
   return articlesResponse.articles!;
  }
}
