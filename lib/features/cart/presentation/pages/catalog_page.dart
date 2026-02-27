import 'package:flutter/material.dart';
import '../../../../core/routes/app_router.dart';
import '../../domain/entities/product.dart';
import '../widgets/add_button_widget.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  static final List<Product> _products = [
    Product(id: '1', name: 'Nasi Goreng', price: 15000),
    Product(id: '2', name: 'Bakso', price: 16000),
    Product(id: '3', name: 'Mie ayam', price: 15000),
    Product(id: '4', name: 'Es Teh', price: 6000),
    Product(id: '5', name: 'Kopi', price: 10000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'Katalog Makanan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => Navigator.pushNamed(context, AppRouter.cart),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _products.length,
        itemBuilder: (context, index) => Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.orange.shade100,
              radius: 25,
              child: const Icon(Icons.fastfood_rounded, color: Colors.orange),
            ),
            title: Text(
              _products[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Rp ${_products[index].price}',
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            trailing: AddButtonWidget(product: _products[index]),
          ),
        ),
      ),
    );
  }
}
