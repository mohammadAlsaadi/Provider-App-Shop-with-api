import 'package:flutter/material.dart';
import 'package:statemanagement/api_manager/product_api.dart';
import 'package:statemanagement/data/home_page/home_page_models/item.dart';
import 'package:statemanagement/data/home_page/home_page_models/products.dart';

class ProductProvider with ChangeNotifier {
  List<Product> products = []; //all product from api
  List<Product> basket = []; //just products added into basket
  late Product productItem; //obj
  double price = 0.0; // price counter
  int productCounter = 0; //product counter of each item

  List<Product> get productsList => products; //get all products

  Future<void> fetchProducts() async {
    products = await ProductApiManager.fetchProducts();
  }

// add item in basket
  void addItem(Product item) {
    basket.add(item);
    price += item.price;
    notifyListeners();
  }

// remove item from basket
  void removeItem(Product item) {
    basket.remove(item);
    price -= item.price;
    notifyListeners();
  }

// remove all items from basket
  void removeBasket() {
    basket = [];
    productItem.productCounter = 0;

    price = 0;
    notifyListeners();
  }

// add item from detail page
  void addItemInDetail(Product item) {
    item.productCounter += 1;
    // productCounter = item.productCounter;

    notifyListeners();
  }

// remove item from detail page

  void removeItemInDetail(Product item) {
    if (item.productCounter > 0) {
      item.productCounter -= 1;
      // productCounter = item.productCounter;
    }
    notifyListeners();
  }

  void productItemForDetail(Product product) {
    productItem = product;
    notifyListeners();
  }

  List<Product> get basketItems {
    return basket;
  }

  double get totalPrice {
    return price;
  }

  int get count {
    return basket.length;
  }

  int get productCount {
    return productCounter;
  }

  Product get productItemFromHome {
    return productItem;
  }
}
