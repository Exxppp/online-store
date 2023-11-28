import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_store/api/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Товар';
    final arguments = Get.arguments;
    final ProductModel product = arguments['product'];
    final titleCategory = arguments['titleCategory'];

    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.white),
          title: const Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: [
            // Product image
            Image.network(
              product.imageUrl,
              height: 400,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/not_found.png',
                  height: 400,
                  fit: BoxFit.contain,
                );
              },
            ),

            // Product title
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Text(
                product.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),

            // Product category
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                  'Название категории: ${titleCategory ?? 'не определить'}'),
            ),

            // Product description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child:
                  Text('Описание товара: ${product.productDescription ?? ''}'),
            ),
          ],
        ));
  }
}
