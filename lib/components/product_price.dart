import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice(
      {super.key, required this.price, required this.hasDiscount});
  final double price;
  final bool hasDiscount;

  @override
  Widget build(BuildContext context) {
    return Text(
      "R\$${price}",
      style: TextStyle(
        decoration:
            hasDiscount ? TextDecoration.lineThrough : TextDecoration.none,
        fontSize: hasDiscount
            ? getProportionateScreenWidth(12)
            : getProportionateScreenWidth(16),
        fontWeight: hasDiscount ? FontWeight.w400 : FontWeight.w600,
        color: hasDiscount ? Colors.red : kPrimaryColor,
      ),
    );
  }
}
