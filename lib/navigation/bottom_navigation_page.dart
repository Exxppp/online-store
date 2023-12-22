import 'package:flutter/material.dart';
import 'package:online_store/navigation/model/navigation_model.dart';

class BottomNavigationPage extends StatelessWidget {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationModel();

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
          return controller.getPage(index);
        },
      ),
    );
  }
}
