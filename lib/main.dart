import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/Screen/home_page/home_page.dart';
import 'package:statemanagement/data/home_page/home_page_provider/home_page_provider.dart';
import 'package:statemanagement/theme/theme_constants.dart';
import 'package:statemanagement/theme/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProductProvider(),
          ),
          ChangeNotifierProvider(create: (context) => DarkThemeProvider())
        ],
        child: Consumer<DarkThemeProvider>(
          builder: (context, theme, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Styles.themeData(theme.darkTheme, context),
              home: HomePage(),
            );
          },
        ));
  }
}
