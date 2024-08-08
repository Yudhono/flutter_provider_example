import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/product.dart';
import 'package:flutter_provider_example/mycart.dart';
import 'package:flutter_provider_example/providers/counter_providers.dart';
import 'package:flutter_provider_example/providers/product_providers.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProviders>(context);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

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
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () => Navigator.pop(context),
                                    icon: const Icon(Icons.close),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    product.image,
                                    scale: 3,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            counterProvider.decrementCounter();
                                          },
                                          icon: const Icon(Icons.remove)),
                                      Text(context
                                          .watch<CounterProviders>()
                                          .counter
                                          .toString()),
                                      IconButton(
                                          onPressed: () {
                                            counterProvider.incrementCounter();
                                          },
                                          icon: const Icon(Icons.add)),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                    onPressed: () {
                                      cartProvider.addProductToCart(
                                          product, counterProvider.counter);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Add to cart',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
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
