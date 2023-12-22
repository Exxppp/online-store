import 'package:flutter/material.dart';
import 'package:online_store/category/model/api/category_api.dart';
import 'package:online_store/category/model/entities/category.dart';

class CategoryModel extends ChangeNotifier {
  final List<Category> categories = <Category>[];
  bool isLoading = false;
  String? loadingError;

  CategoryModel() {
    loadProducts();
  }

  void loadProducts() async {
    isLoading = true;
    notifyListeners();
    try {
      final List<Category> loadedCategories =
          await CategoryApi().getCategories();
      categories.addAll(loadedCategories);
    } catch (error) {
      loadingError = error.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
