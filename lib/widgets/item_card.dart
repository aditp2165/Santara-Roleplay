import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final VoidCallback onAddToCart;

  const ItemCard({Key? key, required this.item, required this.onAddToCart})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: Image.network(
          item.imageUrl,
          width: 48,
          height: 48,
          fit: BoxFit.cover,
        ),
        title: Text(item.name),
        subtitle: Text("Rp ${item.price}"),
        trailing: IconButton(
          icon: const Icon(Icons.add_shopping_cart),
          onPressed: onAddToCart,
        ),
      ),
    );
  }
}
