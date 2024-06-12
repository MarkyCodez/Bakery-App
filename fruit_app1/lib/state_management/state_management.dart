
import 'package:flutter/material.dart';

class StateManagement extends ChangeNotifier {
  List<Map<String, dynamic>> items = [];
  void addItems (Map<String, dynamic> _product) {
    items.add(_product);
    notifyListeners();
  }
  void removeItems (Map<String, dynamic> _product) {
    items.remove(_product);
    notifyListeners();
  }
  void removeAllItems () {
    items.removeRange(0, items.length);
    notifyListeners();
  }
}