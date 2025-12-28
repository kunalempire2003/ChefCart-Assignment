import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/food_detail.dart';
import 'package:my_app/screens/food_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () =>  FoodListScreen(),
        ),
        GetPage(
          name: '/details',
          page: () => FoodDetailScreen(),
        ),
      ],
    );
  }
}
