import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/product.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cart = [];

  List<Product> get cart => _cart;

  void addProductToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeProductFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  int get cartCount => _cart.length;

  double get totalPrice {
    return _cart.fold(0, (sum, product) => sum + product.price);
  }
}
