import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/Screen/home_page/home_page.dart';
import 'package:statemanagement/data/home_page/home_page_provider/cart.dart';
import 'package:statemanagement/data/home_page/home_page_provider/home_page_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ProductProvider();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
