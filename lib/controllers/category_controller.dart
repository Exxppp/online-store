import 'package:flutter/material.dart';
import 'package:online_store/api/category_api.dart';
import 'package:online_store/api/models/category.dart';

class CategoryController extends ChangeNotifier {
  final List<CategoryModel> categories = <CategoryModel>[];
  bool isLoading = false;

  CategoryController() {
    loadProducts();
  }

  void loadProducts() async {
    isLoading = true;
    try {
      final List<CategoryModel> loadedCategories =
          await CategoryApi().getCategories();
      categories.addAll(loadedCategories);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
