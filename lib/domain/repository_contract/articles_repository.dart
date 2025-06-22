import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/domain/entities/article_entity.dart';
import 'package:news_app_c14_online_sun/domain/entities/source_entity.dart';

abstract class ArticlesRepository
{
  Future<Result<List<ArticleEntity>>> getArticles(SourceEntity SourceEntity);
}