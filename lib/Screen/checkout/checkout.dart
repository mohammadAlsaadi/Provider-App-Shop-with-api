import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/Screen/home_page/home_page.dart';
import 'package:statemanagement/data/home_page/home_page_provider/home_page_provider.dart';
import 'package:statemanagement/utils/colors/color.dart';
import 'package:statemanagement/utils/font/font.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: appBarColor,
        title: const Center(
          child: Text(
            'Checkout',
            style: TextStyle(color: white),
          ),
        ),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, product, child) {
          return Padding(
              padding: const EdgeInsets.all(20.0),
              child: product.count > 0
                  ? Column(
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
                                itemCount: product.basketItems.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: pageHeight * 0.01),
                                    child: Card(
                                      child: Stack(
                                        children: [
                                          ListTile(
                                            leading: Image.network(
                                              product.basketItems[index].image,
                                              width: pageWidth * 0.16,
                                            ),
                                            title: Text(
                                              product.basketItems[index].title,
                                              style: titleOfCard,
                                            ),
                                            subtitle: Text(
                                                '${product.basketItems[index].price} \$'),
                                            subtitleTextStyle: subTitleOfCard,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: IconButton(
                                                onPressed: () {
                                                  product.removeItem(product
                                                      .basketItems[index]);
                                                },
                                                icon: const Icon(
                                                  Icons.remove,
                                                  size: 30,
                                                  color: appBarColor,
                                                )),
                                          )
                                        ],
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
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Item count',
                                    style: labelCheckout,
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    '${product.count} items',
                                    style: valueCheckout,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total Price',
                                    style: labelCheckout,
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    '${product.totalPrice} \$',
                                    style: valueCheckout,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: MaterialButton(
                            onPressed: () {
                              product.removeBasket();
                              Navigator.pop(context);
                              const snackBar = SnackBar(
                                  content: Text('Checkout successfully !'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            color: darkMode
                                ? darkThemeBackgroundColor
                                : appBarColor,
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 50, right: 50, top: 20, bottom: 20),
                              child: Text(
                                'Checkout',
                                style: TextStyle(color: white),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: pageHeight * 0.1,
                        ),
                        Image.asset('assets/images/noItemFound.png'),
                        Text(
                          "Does not add any item yet !",
                          style: messageText,
                        ),
                        SizedBox(height: pageHeight * 0.15),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: pageWidth * 0.4,
                            height: pageHeight * 0.05,
                            decoration: BoxDecoration(
                                color: darkMode
                                    ? darkThemeBackgroundColor
                                    : appBarColor,
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                              child: Text(
                                "Add Item",
                                style: buttonBasketFont,
                              ),
                            ),
                          ),
                        )
                      ],
                    ));
        },
      ),
    );
  }
}
