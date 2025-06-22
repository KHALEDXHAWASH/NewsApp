import 'package:flutter/material.dart';
import 'package:news_app_c14_online_sun/news_app.dart';
import 'package:news_app_c14_online_sun/providers/home_provider.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: const NewsApp()));
}