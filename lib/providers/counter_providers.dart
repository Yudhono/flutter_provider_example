import 'package:flutter/material.dart';

class CounterProviders extends ChangeNotifier {
  int _counter = 1;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    if (_counter == 1) return;
    _counter--;
    notifyListeners();
  }

  void resetCounter() {
    _counter = 1;
    notifyListeners();
  }
}
