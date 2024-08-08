import 'package:flutter/material.dart';
import 'package:flutter_provider_example/myapp.dart';
import 'package:flutter_provider_example/providers/counter_providers.dart';
import 'package:flutter_provider_example/providers/product_providers.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => CounterProviders()),
      ],
      child: const MyApp(),
    ),
  );
}
