import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/data/datasource_contract/sources_datasource.dart';
import 'package:news_app_c14_online_sun/data/models/category_model.dart';
import 'package:news_app_c14_online_sun/data/models/sources_response/Source.dart';
import 'package:news_app_c14_online_sun/domain/entities/source_entity.dart';
import 'package:news_app_c14_online_sun/domain/repository_contract/sources_repository.dart';

class SourcesRepositoryImpl implements SourcesRepository
{
  late SourcesDataSource dataSource;

  SourcesRepositoryImpl({required this.dataSource});
  @override
  Future<Result<List<SourceEntity>>> getSources(CategoryModel category) async
  {
   var result = await dataSource.getSources(category);
   switch(result)
   {
     case Success<List<Source>>():
       return Success(data: result.data.map((source) =>source.toSourceEntity() ,).toList());
     case ServerError<List<Source>>():
       return ServerError(code: result.code, message: result.message);
     case GeneralEx<List<Source>>():
       return GeneralEx(exception: result.exception);
   }
  }
  
}