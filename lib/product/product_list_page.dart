import 'package:flutter/material.dart';
import 'package:online_store/product/model/product_list_model.dart';
import 'package:online_store/core/page/base_list_page.dart';
import 'package:online_store/core/view/data_upload_error_widget.dart';
import 'package:online_store/core/model/app_routes.dart';
import 'package:online_store/product/view/product_tile_widget.dart';

class ProductListPage extends BaseListPage {
  final int? categoryId;

  const ProductListPage({
    super.key,
    required super.title,
    this.categoryId,
  });

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState
    extends BaseListPageState<ProductListPage, ProductListModel> {
  @override
  ProductListModel createModel() {
    return ProductListModel(categoryId: widget.categoryId);
  }

  @override
  Widget buildBody(context) {
    if (pageModel.isLoading && pageModel.products.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else if (pageModel.loadingError != null) {
      return DataUploadErrorWidget(textError: pageModel.loadingError);
    } else {
      return ListView.builder(
        controller: pageModel.scrollController,
        itemCount: pageModel.products.length + 1,
        itemExtent: 100,
        itemBuilder: (context, index) {
          if (index < pageModel.products.length) {
            return ProductTileWidget(
              onTap: () {
                Navigator.push(
                  context,
                  AppRoutes.productDetails(
                      pageModel.products[index].productId),
                );
              },
              product: pageModel.products[index],
            );
          } else if (pageModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return null;
        },
      );
    }
  }
}
