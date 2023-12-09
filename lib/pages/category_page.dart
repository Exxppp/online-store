import 'package:flutter/material.dart';
import 'package:online_store/controllers/category_controller.dart';
import 'package:online_store/pages/models_args/product_args.dart';
import 'package:online_store/routes/routes.dart';
import 'package:online_store/widgets/image_network.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late CategoryController controller;

  @override
  void initState() {
    super.initState();
    controller = CategoryController();
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
    const title = 'Категории';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return buildInkWell(context, index);
        },
      ),
    );
  }

  Widget buildInkWell(context, index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppPage.products,
          arguments: ProductArgs(
            categoryId: controller.categories[index].categoryId,
            title: controller.categories[index].title,
          ),
        );
      },
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ImageNetwork(
                  url: controller.categories[index].imageUrl,
                  height: 120,
                  fit: BoxFit.cover,
                )),
              const SizedBox(
                height: 12,
              ),
              Text(
                controller.categories[index].title,
                textAlign: TextAlign.center,
              ),
            ],
          )
        ),
      ),
    );
  }
}
