import 'package:flutter/material.dart';
import 'package:online_store/category/category_page.dart';
import 'package:online_store/product/product_list_page.dart';

class NavigationModel {
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return const CategoryPage();
      case 1:
        return const ProductListPage(title: 'Товары');
      default:
        return const Text('page not found');
    }
  }
}