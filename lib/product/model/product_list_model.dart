import 'package:flutter/material.dart';
import 'package:online_store/product/model/api/product_api.dart';
import 'package:online_store/product/model/entities/product.dart';

class ProductListModel extends ChangeNotifier {
  late int? categoryId;
  final List<Product> products = <Product>[];
  String? loadingError;
  bool isLoading = false;
  bool isGetAllProducts = false;

  int get offset => products.length;

  final ScrollController scrollController = ScrollController();

  ProductListModel({required this.categoryId}) {
    scrollController.addListener(_scrollListener);
    loadProducts();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMoreProducts();
    }
  }

  void loadProducts() async {
    isLoading = true;
    notifyListeners();
    try {
      final List<Product> loadedProducts = await ProductApi()
          .getProducts(offset: offset, categoryId: categoryId);
      if (loadedProducts.isNotEmpty) {
        products.addAll(loadedProducts);
      } else {
        isGetAllProducts = true;
      }
    } catch (error) {
      loadingError = error.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void loadMoreProducts() {
    if (!isLoading && !isGetAllProducts) {
      loadProducts();
    }
  }
}
