import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/data/models/articles_response/Article.dart';
import 'package:news_app_c14_online_sun/data/models/sources_response/Source.dart';
import 'package:news_app_c14_online_sun/domain/entities/source_entity.dart';

abstract class ArticlesDataSource{
  Future<Result<List<Article>>> getArticles(SourceEntity sourceEntity);
}