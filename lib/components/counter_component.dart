import 'package:flutter/material.dart';
import 'package:flutter_provider_example/providers/counter_providers.dart';
import 'package:provider/provider.dart';

class CounterComponent extends StatelessWidget {
  final int quantity;
  const CounterComponent(this.quantity, {super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProviders>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              counterProvider.decrementCounter();
            },
            icon: const Icon(Icons.remove)),
        Text(quantity.toString()),
        IconButton(
            onPressed: () {
              counterProvider.incrementCounter();
            },
            icon: const Icon(Icons.add)),
      ],
    );
  }
}
