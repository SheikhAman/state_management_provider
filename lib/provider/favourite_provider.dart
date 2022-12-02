import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _selectedItemList = [];

  List<int> get selectedItemList => _selectedItemList;

  void addItem(int value) {
    _selectedItemList.add(value);

    notifyListeners();
  }

  void removeItem(int value) {
    _selectedItemList.remove(value);

    notifyListeners();
  }
}
