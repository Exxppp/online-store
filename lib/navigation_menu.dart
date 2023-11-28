import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_store/pages/category_page.dart';
import 'package:online_store/pages/products_page.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          backgroundColor: Colors.black12,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.apps_outlined), label: 'Category'),
            NavigationDestination(icon: Icon(Icons.list), label: 'Products'),
          ],
        ),
      ),
      body:Obx(() => controller.pages[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final pages = [const CategoryPage(), const ProductsPage()];
}
