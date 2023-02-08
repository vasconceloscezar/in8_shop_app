import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import 'home_header.dart';
import 'product_list.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final products =
        Provider.of<ProductProvider>(context, listen: true).products;

    return Column(children: [
      SizedBox(height: getProportionateScreenHeight(20)),
      const HomeHeader(),
      SizedBox(height: getProportionateScreenWidth(20)),
      const Flexible(child: ProductsList()),
      Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: products.isEmpty,
          child: const LinearProgressIndicator(
            color: kPrimaryColor,
          )),
    ]);
  }
}
