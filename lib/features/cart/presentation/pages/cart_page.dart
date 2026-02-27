import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<CartProvider>();

    return Scaffold(appBar: AppBar(title: const Text('Halaman Keranjang')));
  }
}
