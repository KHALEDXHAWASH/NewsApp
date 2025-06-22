import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/data/models/category_model.dart';
import 'package:news_app_c14_online_sun/domain/entities/source_entity.dart';
import 'package:news_app_c14_online_sun/domain/repository_contract/sources_repository.dart';

class GetSourcesUseCase
{
  SourcesRepository repository;
  GetSourcesUseCase({required this.repository});

  Future<Result<List<SourceEntity>>> invoke(CategoryModel category){
    return repository.getSources(category);
  }
}