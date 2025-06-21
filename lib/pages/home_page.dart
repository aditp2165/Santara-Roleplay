import 'package:flutter/material.dart';
import '../data/item_data.dart';
import '../widgets/item_card.dart';
import 'cart_page.dart';
import '../models/item.dart';

class HomePage extends StatefulWidget {
  final Map<Item, int> cart;
  final Function(Item) onAddToCart;

  const HomePage({Key? key, required this.cart, required this.onAddToCart})
    : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Santara RP Store'),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CartPage(cart: widget.cart),
                    ),
                  );
                },
              ),
              if (widget.cart.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      widget.cart.length.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(
            item: items[index],
            onAddToCart: () => widget.onAddToCart(items[index]),
          );
        },
      ),
    );
  }
}
