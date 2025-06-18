import 'package:news_app_c14_online_sun/data/api_services/api_services.dart';
import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/data/datasource_contract/artiles_datasource.dart';
import 'package:news_app_c14_online_sun/data/models/articles_response/Article.dart';
import 'package:news_app_c14_online_sun/data/models/sources_response/Source.dart';
import 'package:news_app_c14_online_sun/domain/entities/source_entity.dart';

class ArticlesApiDataSourceImpl implements ArticlesDataSource{
  ApiServices apiServices;
  ArticlesApiDataSourceImpl({required this.apiServices});

  @override
  Future<Result<List<Article>>> getArticles(SourceEntity sourceEntity) {
    return apiServices.getArticles(sourceEntity);
  }

}