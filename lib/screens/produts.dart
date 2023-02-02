import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: double.tryParse(json['price']) ?? 0,
      imageUrl: json['image_url'],
    );
  }
}

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late Future<List<Product>> _products;

  @override
  void initState() {
    super.initState();
    _products = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder<List<Product>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: () async => setState(
                  () async => _products = await Future.value(fetchProducts())),
              child: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data![index];
                  return ListTile(
                    leading: Image.network(product.imageUrl),
                    title: Text(product.name),
                    subtitle: Text('\$${product.price}'),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Failed to load products'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<List<Product>> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('http://10.0.2.2:3000/api/products'));
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        final products = (responseJson['products'] as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList();
        return products;
      }
    } catch (err) {
      debugPrint(err.toString());
    }
    throw Exception('Failed to load products');
  }
}
