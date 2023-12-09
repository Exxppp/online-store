import 'package:flutter/material.dart';
import 'package:online_store/controllers/products_controller.dart';
import 'package:online_store/routes/routes.dart';
import 'package:online_store/widgets/image_network.dart';

class ProductsPage extends StatefulWidget {
  final int? categoryId;

  const ProductsPage({super.key, this.categoryId});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late ProductsController controller;

  @override
  void initState() {
    super.initState();
    controller = ProductsController(categoryId: widget.categoryId);
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
        title: const Text(
          'Товары',
        ),
      ),
      body: ListView.builder(
        controller: controller.scrollController,
        itemCount: controller.products.length,
        itemExtent: 100,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              tileColor: Colors.grey.withOpacity(0.4),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppPage.productDetail,
                  arguments: controller.products[index].productId,
                );
              },
              leading: ImageNetwork(
                url: controller.products[index].imageUrl,
                width: 70,
                height: 85,
                fit: BoxFit.contain,
              ),
              title: Text(
                controller.products[index].title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              ),
              subtitle: Text(
                '\nЦена:  ${controller.products[index].price}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,
              ),
            ),
          );
        },
      ),
    );
  }
}
