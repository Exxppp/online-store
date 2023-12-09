import 'package:flutter/material.dart';
import 'package:online_store/api/models/product.dart';
import 'package:online_store/api/product_detail_api.dart';

class ProductDetailController extends ChangeNotifier {
  late ProductModel product;
  bool isLoading = true;

  void loadProduct(int productId) async {
    try {
      final productData =
      await ProductDetailApi().getProduct(productId: productId);
      product = productData;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}