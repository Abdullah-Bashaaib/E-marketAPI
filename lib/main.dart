// import 'package:e_market_api/views/get_categories_with_URL.dart';
// import 'package:e_market_api/views/get_categories_with_URL.dart';
import 'package:e_market_api/views/categories_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter E-commerce api',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.systemBackground,
      ),
      home: CategoriesScreen(title: 'Flutter E-commerce api'),
    );
  }
}
