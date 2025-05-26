import 'package:news_app_c14_online_sun/core/assets_manager.dart';

class CategoryModel {
  final String id;
  final String title;
  final String imagePath;

  const CategoryModel(
      {required this.id, required this.title, required this.imagePath});

  static List<CategoryModel> _getCategories() =>
      [
        CategoryModel(
            id: "sports", title: "Sports", imagePath: AssetsManager.sports),
        CategoryModel(id: "entertainment",
            title: "Entertainment",
            imagePath: AssetsManager.entertainment),
        CategoryModel(id: "business",
            title: "Business",
            imagePath: AssetsManager.business),
        CategoryModel(
            id: "science", title: "Science", imagePath: AssetsManager.science),
        CategoryModel(id: "technology",
            title: "Technology",
            imagePath: AssetsManager.tech),
        CategoryModel(
            id: "health", title: "Health", imagePath: AssetsManager.health),
        CategoryModel(
            id: "general", title: "General", imagePath: AssetsManager.general),

      ];
  static List<CategoryModel> categories = _getCategories();
}