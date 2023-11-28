import 'package:get/get.dart';
import 'package:online_store/navigation_menu.dart';
import 'package:online_store/pages/category_page.dart';
import 'package:online_store/pages/product_detail_page.dart';
import 'package:online_store/pages/products_page.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const NavigationMenu()),
    GetPage(name: category, page: () => const CategoryPage()),
    GetPage(name: products, page: () => const ProductsPage()),
    GetPage(name: productDetail, page: () => const ProductDetailPage()),
  ];

  static String navbar = '/';
  static String category = '/category';
  static String products = '/products';
  static String productDetail = '/productDetail';
}