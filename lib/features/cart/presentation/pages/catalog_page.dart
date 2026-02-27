import 'package:flutter/material.dart';
import '../../../../core/routes/app_router.dart';
import '../../domain/entities/product.dart';
import '../widgets/add_button_widget.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  static final List<Product> _products = [
    Product(id: '1', name: 'Nasi Goreng', price: 15000),
    Product(id: '2', name: 'Bakso', price: 16000),
    Product(id: '3', name: 'My ayam', price: 15000),
    Product(id: '4', name: 'Es Teh', price: 6000),
    Product(id: '5', name: 'Kopi', price: 10000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Makanan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, AppRouter.cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_products[index].name),
          subtitle: Text('Rp ${_products[index].price}'),
          trailing: AddButtonWidget(product: _products[index]),
        ),
      ),
    );
  }
}
