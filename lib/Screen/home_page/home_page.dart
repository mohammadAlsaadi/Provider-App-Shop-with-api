import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/Screen/detail/detail.dart';
import 'package:statemanagement/data/home_page/home_page_provider/home_page_provider.dart';
import 'package:statemanagement/theme/theme_manager.dart';
import 'package:statemanagement/utils/colors/color.dart';
import 'package:statemanagement/Screen/checkout/checkout.dart';

import 'package:statemanagement/utils/font/font.dart';

bool darkMode = false;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();

    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    // final providerTheme = Provider.of<ThemeManager>(context);
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return Consumer<ProductProvider>(
      builder: (context, product, child) {
        return Scaffold(
          drawer: Drawer(
            // shadowColor: appBarColor,
            // backgroundColor: appBarColor,

            child: Container(
              decoration: const BoxDecoration(),
              child: ListView(children: [
                const DrawerHeader(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [Text("More options ")],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Switch(
                        // This bool value toggles the switch.
                        value: themeChange.darkTheme,

                        activeColor: grey,
                        onChanged: (bool value) {
                          themeChange.darkTheme = value!;
                          value ? darkMode = true : darkMode = false;
                          // This is called when the user toggles the switch.
                        },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(Icons.dark_mode_outlined, color: white),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text("Dark mode", style: TextStyle(color: white)),
                    ],
                  ),
                  onTap: () {
                    // providerTheme.toggleTheme(true);
                  },
                )
              ]),
            ),
          ),
          // backgroundColor: lightGrey,
          appBar: AppBar(
            title: Row(
              children: [
                SizedBox(
                  width: pageWidth * 0.17,
                ),
                const Text('Home Page'),
                SizedBox(
                  width: pageWidth * 0.2,
                ),
                Stack(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CheckOut(),
                              ));
                        },
                        icon: const Icon(Icons.shopping_cart_rounded,
                            color: white)),
                    Positioned(
                        left: pageHeight * 0.03,
                        top: pageHeight * 0.004,
                        child: SizedBox(
                          width: 17,
                          height: 17,
                          child: CircleAvatar(
                            backgroundColor: white,
                            child: Center(
                                child: Text(
                              '${product.count}',
                              style: couter,
                            )),
                          ),
                        ))
                  ],
                )
              ],
            ),
            // backgroundColor: appBarColor,
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: pageHeight * 0.01),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: product.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(pageHeight * 0.01),
                      child: GestureDetector(
                        onTap: () {
                          product.productItemForDetail(product.products[index]);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailPage(),
                              ));
                        },
                        child: Card(
                          // color: lightThemeBackgroundColor,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: ListTile(
                                    leading: Image.network(
                                      product.products[index].image,
                                      width: pageWidth * 0.16,
                                      // fit: BoxFit.fill,
                                    ),
                                    title: Text(
                                      product.products[index].title,
                                      style: titleOfCard,
                                    ),
                                    subtitle: Text(
                                      product.products[index].category,
                                    )),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: pageWidth * 0.25,
                                        bottom: pageHeight * 0.01),
                                    child: Text(
                                      '${product.products[index].price} \$',
                                      style: priceOfProductDetailFont,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: pageHeight * 0.015,
                                        right: pageWidth * 0.01),
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: SizedBox(
                                          width: pageWidth * 0.2,
                                          height: pageHeight * 0.03,
                                          child: MaterialButton(
                                            onPressed: () {
                                              product.addItem(
                                                  product.products[index]);
                                            },
                                            color: darkMode
                                                ? darkThemeBackgroundColor
                                                : appBarColor,
                                            child: Text(
                                              'Add to cart',
                                              style: buttonBasketFont,
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: product.count > 0,
                child: Padding(
                  padding: EdgeInsets.only(bottom: pageHeight * 0.009),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: pageWidth * 0.7,
                        height: pageHeight * 0.06,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CheckOut(),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: darkMode
                                    ? darkThemeBackgroundColor
                                    : appBarColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: pageWidth * 0.05),
                                  child: CircleAvatar(
                                    backgroundColor: darkMode ? grey : lightRed,
                                    child: Text('${product.count}'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: pageWidth * 0.15),
                                  child: Text(
                                    'Basket',
                                    style: buttonBasketFont,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: pageWidth * 0.1),
                                  child: Text(
                                    '${product.price} \$',
                                    style: buttonBasketFont,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
