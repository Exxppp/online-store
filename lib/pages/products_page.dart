import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_store/api/models/product.dart';
import 'package:online_store/api/product_api.dart';
import 'package:online_store/pages/product_detail_page.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        Get.arguments ?? {'title': null, 'index': null};

    Get.delete<ProductsController>();

    final controller = Get.put(ProductsController());

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          arguments['title'] ?? 'Товары',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Obx(
        () => ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.products.length,
          itemExtent: 100,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                tileColor: Colors.grey,
                onTap: () {
                  Get.to(
                    const ProductDetailPage(),
                    arguments: {
                      'product': controller.products[index],
                      'titleCategory': arguments['title'],
                    },
                  );
                },
                leading: Image.network(
                  controller.products[index].imageUrl,
                  width: 70,
                  height: 85,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/not_found.png',
                      width: 70,
                      height: 85,
                      fit: BoxFit.contain,
                    );
                  },
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
      ),
    );
  }
}

class ProductsController extends GetxController {
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxBool isLoading = false.obs;
  final int itemsPerPage = 15;
  bool isGetAllProducts = false;
  int offset = 0;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMoreProducts();
      }
    });
    loadProducts();
  }

  void loadProducts() async {
    final int? categoryId =
        Get.arguments == null ? null : Get.arguments['categoryId'];
    isLoading.value = true;
    try {
      final List<ProductModel> loadedProducts = await ProductApi()
          .getProducts(offset: offset, categoryId: categoryId);
      if (loadedProducts.isNotEmpty) {
        products.addAll(loadedProducts);
        offset += itemsPerPage;
      } else {
        isGetAllProducts = true;
      }
    } catch (error) {
      Exception('Error loading products: $error');
    } finally {
      isLoading.value = false;
    }
  }

  void loadMoreProducts() {
    if (!isLoading.value && !isGetAllProducts) {
      loadProducts();
    }
  }
}
