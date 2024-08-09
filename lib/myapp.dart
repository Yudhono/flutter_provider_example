import 'package:flutter/material.dart';
import 'package:flutter_provider_example/productlist.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductListScreen(),
    );
  }
}
