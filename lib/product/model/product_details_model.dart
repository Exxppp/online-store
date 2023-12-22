import 'package:flutter/material.dart';
import 'package:online_store/product/model/api/product_api.dart';
import 'package:online_store/product/model/entities/product.dart';

class ProductDetailsModel extends ChangeNotifier {
  late Product product;
  bool isLoading = false;
  String? loadingError;

  void loadProduct(int productId) async {
    try {
      isLoading = true;
      notifyListeners();
      final productData =
          await ProductApi().getProductDetails(productId: productId);
      product = productData;
    } catch (error) {
      loadingError = error.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
