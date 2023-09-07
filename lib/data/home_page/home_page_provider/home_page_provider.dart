import 'package:flutter/material.dart';
import 'package:statemanagement/api_manager/product_api.dart';
import 'package:statemanagement/data/home_page/home_page_models/products.dart';

class ProductProvider with ChangeNotifier {
  List<Product> products = [];
  List<Product> items = [];
  late Product productItem;
  double price = 0.0;

  List<Product> get productsList => products;

  Future<void> fetchProducts() async {
    products = await ProductApiManager.fetchProducts();
  }

  void addItem(Product item) {
    items.add(item);
    price += item.price;
    notifyListeners();
  }

  void removeItem(Product item) {
    items.remove(item);
    price -= item.price;
    notifyListeners();
  }

  void removeBasket() {
    items = [];
    price = 0;
    notifyListeners();
  }

  void addItemInDetail(Product item) {
    price += item.price;

    notifyListeners();
  }

  void removeItemInDetail(Product item) {
    if (price > 0) {
      price -= item.price;
    }
    notifyListeners();
  }

  void productItemForDetail(Product product) {
    productItem = product;
    notifyListeners();
  }

  List<Product> get basketItem {
    return items;
  }

  double get totalPrice {
    return price;
  }

  int get count {
    return items.length;
  }

  Product get productItemFromHome {
    return productItem;
  }
}
