import 'package:flutter/cupertino.dart';
import 'package:news_app_c14_online_sun/presentation/home/home.dart';

class RoutesManager{
  static const String home = "/home";
  static const String search = '/search';
  static Route? router(RouteSettings settings){
    switch (settings.name) {
      case home:
        return CupertinoPageRoute(builder: (context) => const Home(),);
    }
    return null;
  }
}