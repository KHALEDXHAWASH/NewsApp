import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c14_online_sun/data/api_services/result.dart';
import 'package:news_app_c14_online_sun/data/models/category_model.dart';
import 'package:news_app_c14_online_sun/domain/entities/source_entity.dart';
import 'package:news_app_c14_online_sun/domain/usecases/get_sources_usecase.dart';


class SourcesViewModel extends ChangeNotifier
{
  GetSourcesUseCase sourcesUseCase;

  SourcesViewModel({required this.sourcesUseCase});
  SourceViewModelStates state = SourcesLoadingState();

  void emit(SourceViewModelStates newState)
  {
    state = newState;
    notifyListeners();
  }


  Future<void> loadSources(CategoryModel category) async
  {
    emit(SourcesLoadingState());
    var result = await sourcesUseCase.invoke(category);
    switch (result)
    {
      case Success<List<SourceEntity>>():
        emit(SourcesSuccessState(sources: result.data));
      case ServerError<List<SourceEntity>>():
        emit(SourcesErrorState(serverError: result));
      case GeneralEx<List<SourceEntity>>():
        emit(SourcesErrorState(exception: result.exception));
    }
  }
}


sealed class SourceViewModelStates {}

class SourcesSuccessState extends SourceViewModelStates
{
  List<SourceEntity> sources;

  SourcesSuccessState({required this.sources});
}

class SourcesLoadingState extends SourceViewModelStates
{
  String? loadingMsg;

  SourcesLoadingState({this.loadingMsg});
}

class SourcesErrorState extends SourceViewModelStates
{
  ServerError? serverError;
  Exception? exception;

  SourcesErrorState({this.serverError, this.exception});
}
