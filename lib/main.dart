import 'package:flutter/material.dart';
import 'models/item.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<Item, int> cart = {};

  void addToCart(Item item) {
    setState(() {
      cart[item] = (cart[item] ?? 0) + 1;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${item.name} ditambah ke keranjang')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Santara RP Store',
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      home: HomePage(cart: cart, onAddToCart: addToCart),
      debugShowCheckedModeBanner: false,
    );
  }
}
