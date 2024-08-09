import 'package:flutter/material.dart';
import 'package:flutter_provider_example/components/product_details_modal.dart';
import 'package:flutter_provider_example/models/product.dart';
import 'package:flutter_provider_example/mycart.dart';
import 'package:flutter_provider_example/providers/counter_providers.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProviders>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.shopping_bag, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
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
                // Reset the counter state after the current frame
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  counterProvider.resetCounter();
                });
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return ProductDetailsModal(product: product);
                  },
                );
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
