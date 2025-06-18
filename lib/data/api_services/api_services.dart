import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/data/models/articles_response/Article.dart';
import 'package:news_app_c14_online_sun/data/models/articles_response/ArticlesResponse.dart';
import 'package:news_app_c14_online_sun/data/models/category_model.dart';
import 'package:news_app_c14_online_sun/data/models/sources_response/Source.dart';
import 'package:news_app_c14_online_sun/data/models/sources_response/SourcesResponse.dart';
import 'package:news_app_c14_online_sun/domain/entities/source_entity.dart';


class ApiServices {
  static const String _baseUrl = "newsapi.org";
  static const String _apiKey = "79eae4e1d59f42219904c1e4a146ab74";
  static const String _sourcesEndPoint = "/v2/top-headlines/sources";
  static const String _articlesEndPoint = "/v2/everything";

   Future<Result<List<Source>>> getSources(CategoryModel category) async {
    try{
      Uri url = Uri.https(_baseUrl, _sourcesEndPoint, {
        "apiKey": _apiKey,
        "category": category.id,
      });

      var response = await http.get(url);
      var json = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if(sourcesResponse.status == "ok"){
        return Success(data: sourcesResponse.sources!);
      }else{
        return ServerError(code: sourcesResponse.code!, message: sourcesResponse.message!);
      }

    }on Exception catch(e){
      return GeneralEx(exception: e);
    }

  }

   Future<Result<List<Article>>>getArticles(SourceEntity source)async {
    try{
      Uri url =   Uri.https(_baseUrl, _articlesEndPoint, {
        "apiKey": _apiKey,
        "sources": source.id,
      });
      http.Response response = await  http.get(url);
      var json = jsonDecode(response.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if(articlesResponse.status == "ok"){

      return Success(data: articlesResponse.articles!);
      }else{
        return ServerError(code: articlesResponse.code!, message: articlesResponse.message!);
      }
    }on Exception catch(e){
      return GeneralEx(exception: e);
    }

  }
}
