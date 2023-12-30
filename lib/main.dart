import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makan_bang/routes/routes_page.dart';

import 'controller/restaurant_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RestaurantController restaurantController =
      Get.put(RestaurantController());
  MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: RoutePages.pages,
    );
  }
}
