import 'package:flutter/material.dart';
import 'package:online_store/api/models/product.dart';
import 'package:online_store/api/product_detail_api.dart';

class ProductDetailController extends ChangeNotifier {
  late ProductModel product;
  bool isLoading = false;
  bool loadingError = false;

  void loadProduct(int productId) async {
    try {
      isLoading = true;
      final productData =
      await ProductDetailApi().getProduct(productId: productId);
      product = productData;
    } catch (error) {
      loadingError = true;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}