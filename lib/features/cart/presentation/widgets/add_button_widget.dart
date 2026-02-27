import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/product.dart';
import '../providers/cart_provider.dart';

class AddButtonWidget extends StatelessWidget {
  final Product product;
  const AddButtonWidget({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final isInCart = context.select<CartProvider, bool>(
      (provider) => provider.isInCart(product.id),
    );

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isInCart ? Colors.green.shade50 : Colors.blueAccent,
        foregroundColor: isInCart ? Colors.green : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        elevation: isInCart ? 0 : 2,
      ),
      onPressed: isInCart
          ? null
          : () => context.read<CartProvider>().addItem(product),
      child: isInCart
          ? const Icon(Icons.check_circle, color: Colors.green)
          : const Text('Tambah'),
    );
  }
}
