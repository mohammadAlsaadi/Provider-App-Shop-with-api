import 'package:flutter/material.dart';
import 'package:statemanagement/data/home_page/home_page_models/item.dart';

class Cart with ChangeNotifier {
  List<Item> items = [];

  double price = 0.0;

  void add(Item item) {
    items.add(item);
    price += item.itemPrice;
    notifyListeners();
  }

  int get count {
    return items.length;
  }

  double get totalPrice {
    return price;
  }

  List<Item> get basketItem {
    return items;
  }
}
