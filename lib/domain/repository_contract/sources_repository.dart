import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/data/models/category_model.dart';

import 'package:news_app_c14_online_sun/domain/entities/source_entity.dart';

abstract class SourcesRepository
{
  Future<Result<List<SourceEntity>>> getSources(CategoryModel category);
}