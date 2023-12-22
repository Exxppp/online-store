import 'package:flutter/material.dart';
import 'package:online_store/product/product_details_page.dart';
import 'package:online_store/product/product_list_page.dart';

class AppRoutes {

  static MaterialPageRoute productList({
    int? categoryId,
    required String title,
  }) {
    return MaterialPageRoute(
      builder: (context) => ProductListPage(
        categoryId: categoryId,
        title: title,
      ),
    );
  }

  static MaterialPageRoute productDetails(int productId) {
    return MaterialPageRoute(
      builder: (context) => ProductDetailsPage(
        productId: productId,
      ),
    );
  }
}
