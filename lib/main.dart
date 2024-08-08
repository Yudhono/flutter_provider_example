import 'package:flutter/material.dart';
import 'package:flutter_provider_example/myapp.dart';
import 'package:flutter_provider_example/providers/product_providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}
