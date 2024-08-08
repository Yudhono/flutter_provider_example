import 'package:flutter/material.dart';
import 'package:flutter_provider_example/providers/product_providers.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: ListView.builder(
        itemCount: cartProvider.cart.length,
        itemBuilder: (context, index) {
          final product = cartProvider.cart[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListTile(
                  leading: Image.asset(product.image),
                  title: Text(product.name),
                  subtitle: Text(product.price.toString()),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .removeProductFromCart(product);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
