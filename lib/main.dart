import 'package:flutter/material.dart';
import 'package:mini_shop_with_provider/providers/products_provider.dart';
import 'package:mini_shop_with_provider/screens/cart_screen.dart';
import 'package:mini_shop_with_provider/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => ProductsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,

      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        CartScreen.routeName: (context) => CartScreen(),
      },
    );
  }
}
