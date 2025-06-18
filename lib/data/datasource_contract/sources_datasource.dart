import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/data/models/category_model.dart';
import 'package:news_app_c14_online_sun/data/models/sources_response/Source.dart';

abstract class SourcesDataSource{
  Future<Result<List<Source>>> getSources(CategoryModel category);
}