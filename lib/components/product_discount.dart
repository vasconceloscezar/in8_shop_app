import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

class ProductDiscount extends StatelessWidget {
  const ProductDiscount(
      {super.key,
      required this.priceWithDiscount,
      required this.price,
      required this.hasDiscount});
  final double price, priceWithDiscount;
  final bool hasDiscount;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        maintainSize: true,
        maintainState: true,
        maintainAnimation: true,
        visible: hasDiscount,
        child: Text(
          "R\$${hasDiscount ? priceWithDiscount : price}",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ));
  }
}
