import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_store/api/category_api.dart';
import 'package:online_store/api/models/category.dart';
import 'package:online_store/pages/products_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Категории';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: CategoryApi().getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final categories = List<CategoryModel>.from(snapshot.data!);
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  onPressed: () {
                    Get.to(const ProductsPage(), arguments: {
                      'title': categories[index].title,
                      'categoryId': categories[index].categoryId,
                    });
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ))),
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              categories[index].imageUrl,
                              height: 120,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/not_found.png',
                                  height: 120,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            categories[index].title,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                );
              },
            );
          }
        },
      ),
    );
  }
}
