import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/components/product_card.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final products =
        Provider.of<ProductProvider>(context, listen: true).products;
    return Column(
      children: [
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              ...products.map((product) => ProductCard(product: product)),
            ],
          ),
        )
      ],
    );
  }
}
