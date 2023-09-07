import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/data/home_page/home_page_provider/home_page_provider.dart';
import 'package:statemanagement/utils/colors/color.dart';
import 'package:statemanagement/Screen/checkout/checkout.dart';
import 'package:statemanagement/data/home_page/home_page_provider/cart.dart';
import 'package:statemanagement/data/home_page/home_page_models/item.dart';
import 'package:statemanagement/data/home_page/home_page_models/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Fetch products when the page is initialized
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... Your existing code

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<ProductProvider>(
          builder: (context, productProvider, child) {
            final products = productProvider.productsList;

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    child: Consumer<Cart>(
                      builder: (context, cart, child) {
                        return ListTile(
                          title: Text(
                            product
                                .title, // Assuming your Product model has an itemName field
                            style: TextStyle(color: appBarColor),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: appBarColor,
                            ),
                            onPressed: () {
                              cart.add(Item(
                                itemName: product.title,
                                itemPrice: product.price,
                              ));
                            },
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
