import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/data/models/articles_response/ArticleDM.dart';

abstract class search_repo
{
  Future<Result<List<Article>>>search(String query);
 // Future< Result<List<Article>>>searchquery(String query );
}