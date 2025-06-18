
import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/data/datasource_contract/artiles_datasource.dart';
import 'package:news_app_c14_online_sun/data/models/articles_response/Article.dart';
import 'package:news_app_c14_online_sun/data/models/sources_response/Source.dart';
import 'package:news_app_c14_online_sun/domain/entities/article_entity.dart';
import 'package:news_app_c14_online_sun/domain/entities/source_entity.dart';
import 'package:news_app_c14_online_sun/domain/repository_contract/articles_repository.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  ArticlesDataSource dataSource;

  ArticlesRepositoryImpl({required this.dataSource});

  @override
  Future<Result<List<ArticleEntity>>> getArticles(SourceEntity sourceEntity)async {
    var result = await dataSource.getArticles(sourceEntity);
    switch(result){

      case Success<List<Article>>():
       return Success(data: result.data.map((article) =>article.toArticleEntity() ,).toList());
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case GeneralEx<List<Article>>():
        return GeneralEx(exception: result.exception);
    }
  }
}
