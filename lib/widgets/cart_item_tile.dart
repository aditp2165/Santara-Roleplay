import 'package:flutter/material.dart';
import '../models/item.dart';

class CartItemTile extends StatelessWidget {
  final Item item;
  final int quantity;
  final VoidCallback onRemove;

  const CartItemTile({
    Key? key,
    required this.item,
    required this.quantity,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        item.imageUrl,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
      title: Text(item.name),
      subtitle: Text('x$quantity'),
      trailing: IconButton(icon: const Icon(Icons.delete), onPressed: onRemove),
    );
  }
}
