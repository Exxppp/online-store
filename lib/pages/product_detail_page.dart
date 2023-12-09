import 'package:flutter/material.dart';
import 'package:online_store/controllers/product_detail_controller.dart';
import 'package:online_store/widgets/image_network.dart';

class ProductDetailPage extends StatefulWidget {
  final int productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final controller = ProductDetailController();

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
    const title = 'Товар';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                // Product image
                ImageNetwork(
                  url: controller.product.imageUrl,
                  height: 400,
                  fit: BoxFit.contain,
                ),

                // Product title
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 10.0),
                  child: Text(
                    controller.product.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),

                // Product description
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: Text(
                      'Описание товара: ${controller.product.productDescription ?? ''}'),
                ),
              ],
            ),
    );
  }
}
