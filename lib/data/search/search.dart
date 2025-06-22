import '../api_services/result.dart';
import '../models/articles_response/ArticleDM.dart';

abstract class searchDS
{
  Future< Result<List<Article>>>searchquery(String query );
}