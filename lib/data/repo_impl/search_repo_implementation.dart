import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/data/models/articles_response/ArticleDM.dart';
import 'package:news_app_c14_online_sun/data/search/search.dart';
import 'package:news_app_c14_online_sun/domain/repository_contract/search_repo.dart';

class search_repo_implementation extends search_repo{
  final searchDS _ds;

  search_repo_implementation(this._ds);
  @override
  Future<Result<List<Article>>> search(String query) async{
    // TODO: implement search
    var result = await _ds.searchquery(query);

    switch (result)
    {
      case Success<List<Article>>():
        return Success(data: result.data);
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case GeneralEx<List<Article>>():
        return GeneralEx(exception: result.exception);
    }
  }
  
  
}