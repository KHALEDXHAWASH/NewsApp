

sealed class Result<T>
{

}


class Success<T> extends Result<T>
{
 T data;
 Success({required this.data});
}

class ServerError<T> extends Result<T>
{
  String code;
  String message;
  ServerError({required this.code, required this.message});
}


class GeneralEx<T> extends Result<T>
{
  Exception exception;
  GeneralEx({required this.exception});
}