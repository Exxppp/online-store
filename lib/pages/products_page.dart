import 'package:flutter/material.dart';
import 'package:online_store/controllers/products_controller.dart';
import 'package:online_store/pages/base_list_page.dart';
import 'package:online_store/pages/models_args/product_args.dart';
import 'package:online_store/routes/routes.dart';
import 'package:online_store/widgets/data_upload_error.dart';
import 'package:online_store/widgets/product_tile.dart';

class ProductsPage extends BaseListPage {
  final ProductArgs productArgs;

  ProductsPage({Key? key, required this.productArgs})
      : super(
          key: key,
          controller: ProductsController(categoryId: productArgs.categoryId),
          title: productArgs.title,
        );

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends BaseListPageState<ProductsPage> {

  @override
  Widget body() {
    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (controller.loadingError) {
      return const DataUploadError();
    } else {
      return ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.products.length,
          itemExtent: 100,
          itemBuilder: (context, index) {
            return ProductTile(
              pushNamed: () {
                Navigator.pushNamed(
                  context,
                  AppPage.productDetail,
                  arguments: controller.products[index].productId,
                );
              },
              product: controller.products[index],
            );
          });
    }
  }
}
