import 'package:flutter/material.dart';
import 'package:online_store/api/models/product.dart';
import 'package:online_store/api/product_api.dart';

class ProductsController extends ChangeNotifier {
  late int? categoryId;
  final List<ProductModel> products = <ProductModel>[];
  final int itemsPerPage = 15;
  bool loadingError = false;
  bool isLoading = false;
  bool isGetAllProducts = false;
  int offset = 0;

  final ScrollController scrollController = ScrollController();

  ProductsController({required this.categoryId}) {
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
    try {
      final List<ProductModel> loadedProducts = await ProductApi()
          .getProducts(offset: offset, categoryId: categoryId);
      if (loadedProducts.isNotEmpty) {
        products.addAll(loadedProducts);
        offset = products.length;
      } else {
        isGetAllProducts = true;
      }
    } catch (error) {
      loadingError = true;
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
