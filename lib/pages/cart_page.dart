import 'package:flutter/material.dart';
import '../models/item.dart';
import '../widgets/cart_item_tile.dart';

class CartPage extends StatefulWidget {
  final Map<Item, int> cart;

  const CartPage({Key? key, required this.cart}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int get total {
    int t = 0;
    widget.cart.forEach((item, qty) {
      t += item.price * qty;
    });
    return t;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang')),
      body: widget.cart.isEmpty
          ? const Center(child: Text('Keranjang kosong'))
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: widget.cart.entries.map((entry) {
                      return CartItemTile(
                        item: entry.key,
                        quantity: entry.value,
                        onRemove: () {
                          setState(() {
                            widget.cart.remove(entry.key);
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: Rp $total',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Simulasi checkout
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Pembayaran'),
                              content: const Text(
                                'Transaksi berhasil!\nSilakan cek /pm dari admin IG: @SantaraRP',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      widget.cart.clear();
                                    });
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
