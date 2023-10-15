import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/Screen/home_page/home_page.dart';
import 'package:statemanagement/data/home_page/home_page_provider/home_page_provider.dart';
import 'package:statemanagement/utils/colors/color.dart';
import 'package:statemanagement/utils/font/font.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int productCounter = 0;
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;

    return Consumer<ProductProvider>(
      builder: (context, product, child) {
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: pageWidth * 0.8, top: pageHeight * 0.06),
                child: CircleAvatar(
                  backgroundColor: lightGrey,
                  child: Padding(
                    padding: EdgeInsets.only(left: pageWidth * 0.01),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: appBarColor,
                          size: 25,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: SizedBox(
                  width: pageWidth,
                  height: pageHeight * 0.3,
                  child: Image.network(
                    product.productItemFromHome.image,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: pageHeight * 0.04,
                    left: pageWidth * 0.03,
                    right: pageWidth * 0.03),
                child: Text(
                  textAlign: TextAlign.center,
                  product.productItem.title,
                  style: titleInDetail,
                ),
              ),
              Text(
                product.productItem.category,
                style: categoryInDetail,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Description : ',
                    style: titleInDetail,
                    children: <TextSpan>[
                      TextSpan(
                          text: product.productItem.description,
                          style: descriptionInDetail),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: pageWidth * 0.5, top: pageHeight * 0.05),
                child: RichText(
                  text: TextSpan(
                    text: 'Price : ',
                    style: titleInDetail,
                    children: <TextSpan>[
                      TextSpan(
                          text: '${product.productItem.price} \$',
                          style: priceOfProductDetailFont),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: pageWidth * 0.5, top: pageHeight * 0.03),
                child: Stack(
                  children: [
                    Container(
                      width: pageWidth * 0.25,
                      height: pageHeight * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color:
                            darkMode ? darkThemeBackgroundColor : appBarColor,
                      ),
                    ),
                    Positioned(
                      left: pageWidth * 0.075,
                      top: pageHeight * 0.004,
                      child: Container(
                        width: pageWidth * 0.1,
                        height: pageHeight * 0.04,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: white),
                        child: Center(
                            child: Text(
                          "${product.productItem.productCounter}",
                          style: TextStyle(color: darkThemeBackgroundColor),
                        )),
                      ),
                    ),
                    Positioned(
                      right: pageWidth * 0.15,
                      child: IconButton(
                          onPressed: () {
                            product.removeItem(product.productItem);
                            product.removeItemInDetail(product.productItem);
                          },
                          icon: const Icon(
                            Icons.remove,
                            size: 25,
                            color: white,
                          )),
                    ),
                    Positioned(
                      left: pageWidth * 0.15,
                      child: IconButton(
                          onPressed: () {
                            product.addItem(product.productItem);
                            product.addItemInDetail(product.productItem);
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 25,
                            color: white,
                          )),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: product.productItem.productCounter > 0,
                child: Padding(
                  padding: EdgeInsets.only(top: pageHeight * 0.05),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: pageWidth * 0.4,
                        height: pageHeight * 0.06,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: appBarColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: pageWidth * 0.05),
                                  child: CircleAvatar(
                                    backgroundColor: lightRed,
                                    child: Text(
                                        '${product.productItem.productCounter}'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: pageWidth * 0.15),
                                  child: Text(
                                    'Add',
                                    style: buttonBasketFont,
                                  ),
                                ),
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
