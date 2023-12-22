import 'package:flutter/material.dart';
import 'package:online_store/product/model/product_details_model.dart';
import 'package:online_store/core/view/data_upload_error_widget.dart';
import 'package:online_store/core/view/image_network.dart';

class ProductDetailsPage extends StatefulWidget {
  final int productId;

  const ProductDetailsPage({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final controller = ProductDetailsModel();

  @override
  void initState() {
    super.initState();
    controller.loadProduct(widget.productId);
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
        title: const Text('Товар'),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (controller.loadingError != null) {
      return DataUploadErrorWidget(textError: controller.loadingError);
    } else {
      return ListView(
        children: [
          // Product image
          ImageNetwork(
            url: controller.product.imageUrl,
            height: 400,
            fit: BoxFit.contain,
          ),

          // Product title
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Text(
              controller.product.title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),

          // Product description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Text(
              'Описание товара: ${controller.product.productDescription ?? ''}',
            ),
          ),
        ],
      );
    }
  }
}
