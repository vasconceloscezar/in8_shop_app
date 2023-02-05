import 'package:flutter/material.dart';
import 'package:e_commerce_app/components/rounded_icon_btn.dart';
import 'package:e_commerce_app/models/product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class QuantityCounter extends StatelessWidget {
  const QuantityCounter({
    Key? key,
    required this.product,
    required this.quantity,
    required this.add,
    required this.remove,
  }) : super(key: key);

  final int quantity;
  final Product product;
  final GestureTapCallback add;
  final GestureTapCallback remove;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          Text(
            "Quantidade",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              fontWeight: FontWeight.w600,
              color: kPrimaryColor,
            ),
          ),
          const Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () => remove(),
          ),
          SizedBox(width: getProportionateScreenWidth(10)),
          Text(
            "$quantity",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              fontWeight: FontWeight.w600,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(10)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () => add(),
          ),
        ],
      ),
    );
  }
}
