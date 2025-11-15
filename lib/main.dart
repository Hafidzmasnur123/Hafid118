import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grid Produk',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProductGridPage(),
    );
  }
}

// -------------------------------------------------------------
// DATA PRODUK
// -------------------------------------------------------------
class Product {
  final String name;
  final String imageUrl;
  final String price;

  Product({required this.name, required this.imageUrl, required this.price});
}

// -------------------------------------------------------------
// HALAMAN GRID PRODUK
// -------------------------------------------------------------
class ProductGridPage extends StatelessWidget {
  const ProductGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        name: "Kaos lengan panjang",
        price: "Rp 50.000",
        imageUrl:
            "https://images.pexels.com/photos/6311584/pexels-photo-6311584.jpeg",
      ),
      Product(
        name: "Sepatu Sport",
        price: "Rp 120.000",
        imageUrl:
            "https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg",
      ),
      Product(
        name: "setelan baju olahraga cewek",
        price: "Rp 25.000",
        imageUrl:
            "https://images.pexels.com/photos/6311396/pexels-photo-6311396.jpeg",
      ),
      Product(
        name: "Setelan hodie dan celana",
        price: "Rp 85.000",
        imageUrl:
            "https://images.pexels.com/photos/6311397/pexels-photo-6311397.jpeg",
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Grid Produk')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// KARTU PRODUK
// -------------------------------------------------------------
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.broken_image, size: 40),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  product.price,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
