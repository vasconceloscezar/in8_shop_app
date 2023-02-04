import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'home_header.dart';
import 'product_list.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: getProportionateScreenHeight(20)),
      const HomeHeader(),
      SizedBox(height: getProportionateScreenWidth(20)),
      const Flexible(child: ProductsList()),
    ]);
  }
}
