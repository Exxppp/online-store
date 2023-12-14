import 'package:flutter/material.dart';
import 'package:online_store/controllers/category_controller.dart';
import 'package:online_store/pages/models_args/product_args.dart';
import 'package:online_store/routes/routes.dart';
import 'package:online_store/widgets/category_grid_item.dart';
import 'package:online_store/widgets/data_upload_error.dart';

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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (controller.loadingError) {
      return const DataUploadError();
    } else {
      return GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return CategoryGridItem(
            pushNamed: () {
              Navigator.pushNamed(
                context,
                AppPage.products,
                arguments: ProductArgs(
                  categoryId: controller.categories[index].categoryId,
                  title: controller.categories[index].title,
                ),
              );
            },
            category: controller.categories[index],
          );
        },
      );
    }
  }
}
