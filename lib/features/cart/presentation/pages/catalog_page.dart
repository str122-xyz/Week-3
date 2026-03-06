import 'package:flutter/material.dart';
import '../../../../core/routes/app_router.dart';
import '../../domain/entities/product.dart';
import '../widgets/add_button_widget.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  static final List<Product> _products = [
    Product(
      id: '1',
      name: 'Nasi Goreng',
      price: 15000,
      imagePath: 'assets/image/nasi-goreng.png',
    ),
    Product(
      id: '2',
      name: 'Bakso',
      price: 16000,
      imagePath: 'assets/image/bakso.png',
    ),
    Product(
      id: '3',
      name: 'Mie ayam',
      price: 15000,
      imagePath: 'assets/image/mie-ayam.png',
    ),
    Product(
      id: '4',
      name: 'Es Teh',
      price: 6000,
      imagePath: 'assets/image/esteh.png',
    ),
    Product(
      id: '5',
      name: 'Kopi',
      price: 10000,
      imagePath: 'assets/image/coffee.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0072FF), Color(0xFF00C6FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
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
          color: Colors.grey.shade50,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: Image.asset(
              _products[index].imagePath,
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.fastfood, color: Colors.orange, size: 40),
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
