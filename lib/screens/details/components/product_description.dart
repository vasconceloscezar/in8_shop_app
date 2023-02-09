import 'package:e_commerce_app/components/product_discount.dart';
import 'package:e_commerce_app/components/product_price.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/product.dart';

import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            product.name,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            product.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProductPrice(
                    price: product.price, hasDiscount: product.hasDiscount),
                ProductDiscount(
                    priceWithDiscount: product.priceWithDiscount,
                    price: product.price,
                    hasDiscount: product.hasDiscount)
              ]),
        ),
      ],
    );
  }
}
