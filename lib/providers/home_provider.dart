import 'package:flutter/material.dart';
import 'package:news_app_c14_online_sun/data/models/category_model.dart';
import 'package:news_app_c14_online_sun/presentation/home/categories_view/categories_view.dart';
import 'package:news_app_c14_online_sun/presentation/home/sources_view/sources_view.dart';

class HomeProvider extends ChangeNotifier
{
  Widget homeView = CategoriesView();
  String title = "Home";

  void changHomeViewToSources(CategoryModel category)
  {
    homeView = SourcesView(category: category,);
    title = category.title;
    notifyListeners();
  }

  void changeViewToCategories()
  {
    homeView = CategoriesView();
    notifyListeners();
  }
}

