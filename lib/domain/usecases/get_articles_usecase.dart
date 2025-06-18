import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/domain/entities/article_entity.dart';
import 'package:news_app_c14_online_sun/domain/entities/source_entity.dart';
import 'package:news_app_c14_online_sun/domain/repository_contract/articles_repository.dart';

class GetArticlesUseCase{
  ArticlesRepository repository;
  GetArticlesUseCase({required this.repository});
  Future<Result<List<ArticleEntity>>> invoke(SourceEntity sourceEntity){
    return repository.getArticles(sourceEntity);
  }
}