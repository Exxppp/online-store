import 'package:flutter/material.dart';
import 'package:online_store/pages/models_args/product_args.dart';
import 'package:online_store/routes/routes.dart';
import 'package:online_store/navigation_menu.dart';
import 'package:online_store/pages/category_page.dart';
import 'package:online_store/pages/product_detail_page.dart';
import 'package:online_store/pages/products_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPage.navbar,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            switch (settings.name) {
              case AppPage.navbar:
                return const NavigationMenu();
              case AppPage.category:
                return CategoryPage();
              case AppPage.products:
                final ProductArgs productArgs = settings.arguments as ProductArgs;
                return ProductsPage(productArgs: productArgs);
              case AppPage.productDetail:
                final int productId = settings.arguments as int;
                return ProductDetailPage(productId: productId);
              default:
                return const Text('page not found');
            }
          },
        );
      },
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
