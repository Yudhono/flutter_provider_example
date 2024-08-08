import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/product.dart';
import 'package:flutter_provider_example/mycart.dart';
import 'package:flutter_provider_example/providers/product_providers.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.shopping_bag, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        },
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final product = productList[index];
            return InkWell(
              onTap: () {
                Provider.of<CartProvider>(context, listen: false)
                    .addProductToCart(product);
              },
              child: Column(children: [
                Image.asset(
                  product.image,
                  scale: 2,
                ),
                Text(product.name),
                Text(product.price.toString()),
              ]),
            );
          },
        ),
      ),
    );
  }
}
