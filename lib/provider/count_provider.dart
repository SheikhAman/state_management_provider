import 'package:flutter/material.dart';

// changenotifier satestate er kaj kore.
class CountProvider with ChangeNotifier {
  int _count = 50;
  int get count => _count;

  void setCount() {
    _count++;
    print(count.toString());
    notifyListeners();
  }
}
