// product_details_modal.dart
import 'package:flutter/material.dart';
import 'package:flutter_provider_example/components/counter_component.dart';
import 'package:flutter_provider_example/models/product.dart';
import 'package:flutter_provider_example/providers/counter_providers.dart';
import 'package:flutter_provider_example/providers/product_providers.dart';
import 'package:provider/provider.dart';

class ProductDetailsModal extends StatelessWidget {
  final Product product;

  const ProductDetailsModal({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProviders>(context);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    product.image,
                    scale: 3,
                  ),
                  const CounterComponent(),
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
                          borderRadius: BorderRadius.circular(10),
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
  }
}
