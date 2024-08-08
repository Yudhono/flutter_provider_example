import 'package:flutter_provider_example/models/product.dart';

class Cart {
  Product product;
  int quantity;

  Cart({required this.product, required this.quantity});

  double get totalPrice => product.price.toDouble() * quantity;
}
