import 'package:flutter/material.dart';
import 'package:online_store/pages/category_page.dart';
import 'package:online_store/pages/products_page.dart';
import 'package:online_store/pages/models_args/product_args.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController();

    return Scaffold(
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: controller.selectedIndex,
          builder: (context, index, _) => NavigationBar(
            height: 80,
            backgroundColor: Colors.black12,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (int index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.apps_outlined),
                label: 'Category',
              ),
              NavigationDestination(
                icon: Icon(Icons.list),
                label: 'Products',
              ),
            ],
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: controller.selectedIndex,
          builder: (context, index, _) {
            return controller.pages[index];
          },
        ));
  }
}

class NavigationController {
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  final pages = [
    const CategoryPage(),
    const ProductsPage(productArgs: ProductArgs(title: 'Товары')),
  ];
}
