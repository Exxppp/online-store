import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_store/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPage.navbar,
      getPages: AppPage.routes,
    );
  }
}
