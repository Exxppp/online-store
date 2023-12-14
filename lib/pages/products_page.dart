import 'package:flutter/material.dart';
import 'package:online_store/controllers/products_controller.dart';
import 'package:online_store/pages/models_args/product_args.dart';
import 'package:online_store/routes/routes.dart';
import 'package:online_store/widgets/data_upload_error.dart';
import 'package:online_store/widgets/product_tile.dart';

class ProductsPage extends StatefulWidget {
  final ProductArgs productArgs;

  const ProductsPage({super.key, required this.productArgs});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late ProductsController controller;

  @override
  void initState() {
    super.initState();
    controller = ProductsController(categoryId: widget.productArgs.categoryId);
    controller.addListener(_controllerListener);
  }

  @override
  void dispose() {
    controller.removeListener(_controllerListener);
    super.dispose();
  }

  void _controllerListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.productArgs.title,
          ),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
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
