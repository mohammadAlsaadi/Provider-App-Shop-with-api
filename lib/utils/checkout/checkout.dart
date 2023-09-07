import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/utils/colors/color.dart';
import 'package:statemanagement/data/home_page/home_page_provider/cart.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Center(
          child: Text(
            'Checkout',
            style: TextStyle(color: white),
          ),
        ),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView.builder(
                        itemCount: cart.basketItem.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text('${cart.items[index].itemName}'),
                              subtitle: Text(
                                '${cart.items[index].itemPrice}',
                                style: TextStyle(color: appBarColor),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Price',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '${cart.totalPrice} \$',
                        style: TextStyle(color: appBarColor),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      final snackBar =
                          SnackBar(content: Text('Checkout successfully !'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    color: appBarColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 20, bottom: 20),
                      child: Text(
                        'Checkout',
                        style: TextStyle(color: white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
