import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app_c14_online_sun/data/api_services/result.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key, this.serverError, this.exception});
  final ServerError? serverError;
  final Exception? exception;

  @override
  Widget build(BuildContext context) {
    return Text(extractErrorMsg());
  }

  String extractErrorMsg(){
    String message = "Error";
    if(serverError != null){
      message = serverError!.message;
      return message;
    }
    if(exception is SocketException){
      message = 'There is no internet connection ';
      return message;
    }
    if(exception is FormatException){
      message = "Bad response format ";
      return message;
    }
    if(exception is HttpException){
      message = "Couldn't find the post ";
      return message;
    }
    return message;
  }
}
