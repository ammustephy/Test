import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/restaurant_controller.dart';
import 'views/restaurant_screen.dart';
import 'views/categories_screen.dart';

void main() {
  Get.put(
    RestaurantController(),
  ); //initialize the controller globally so it's ready for all other pages.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // to enable context less naviation
      title: 'Restaurant App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF5722)),
        useMaterial3: true,
        fontFamily: 'Roboto', // Default, but clearly defining it can help
      ),
      home: const MainSwiper(),
    );
  }
}

class MainSwiper extends StatelessWidget {
  const MainSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    // Using a PageView to allow viewing both requested screens
    return PageView(children: const [RestaurantScreen(), CategoriesScreen()]);
  }
}
