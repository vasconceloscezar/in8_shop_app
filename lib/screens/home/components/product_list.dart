import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/components/product_card.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final products =
        Provider.of<ProductProvider>(context, listen: true).products;
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      children: [
        ...products.map((product) => ProductCard(product: product)),
      ],
    );
  }
}
