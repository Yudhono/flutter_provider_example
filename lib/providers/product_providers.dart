import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/cart.dart';
import 'package:flutter_provider_example/models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Cart> _cart = [];

  List<Cart> get cart => _cart;

  void addProductToCart(Product product, int quantity) {
    _cart.add(Cart(product: product, quantity: quantity));
    notifyListeners();
  }

  void removeProductFromCart(Product product, int quantity) {
    final cartItem = _cart.firstWhere(
      (item) => item.product == product && item.quantity == quantity,
      orElse: () => Cart(
          product: product, quantity: 0), // Not recommended unless necessary
    );

    if (cartItem.quantity != 0) {
      _cart.remove(cartItem);
      notifyListeners();
    }
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  int get cartCount => _cart.length;

  double get cartTotal => _cart
      .map((cartItem) => cartItem.product.price.toDouble() * cartItem.quantity)
      .reduce((value, element) => value + element);
}
