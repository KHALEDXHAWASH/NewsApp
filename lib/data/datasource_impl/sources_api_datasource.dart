import 'package:news_app_c14_online_sun/data/api_services/api_services.dart';
import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/data/datasource_contract/sources_datasource.dart';
import 'package:news_app_c14_online_sun/data/models/category_model.dart';
import 'package:news_app_c14_online_sun/data/models/sources_response/Source.dart';

class SourcesApiDataSourceImpl implements SourcesDataSource
{
 late  ApiServices apiServices;
  SourcesApiDataSourceImpl({required this.apiServices});
  @override
  Future<Result<List<Source>>> getSources(CategoryModel category)
  {
    return apiServices.getSources(category);
  }
}






