import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Keranjang')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.items.length,
              itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.fastfood_outlined),
                title: Text(provider.items[index].name),
                subtitle: Text('Rp ${provider.items[index].price}'),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () => provider.removeAll(),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                'Hapus Keranjang',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
