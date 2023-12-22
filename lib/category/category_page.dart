import 'package:flutter/material.dart';
import 'package:online_store/category/model/category_model.dart';
import 'package:online_store/core/page/base_list_page.dart';
import 'package:online_store/core/view/data_upload_error_widget.dart';
import 'package:online_store/core/model/app_routes.dart';
import 'package:online_store/category/view/category_grid_item.dart';

class CategoryPage extends BaseListPage {
  const CategoryPage({
    super.key,
    super.title = 'Категории',
  });

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState
    extends BaseListPageState<CategoryPage, CategoryModel> {
  @override
  CategoryModel createController() {
    return CategoryModel();
  }

  @override
  Widget buildBody(context) {
    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (controller.loadingError != null) {
      return DataUploadErrorWidget(textError: controller.loadingError);
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
            onTap: () {
              Navigator.push(
                context,
                AppRoutes.productList(
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
