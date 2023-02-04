import 'package:flutter/material.dart';
import 'package:e_commerce_app/components/rounded_icon_btn.dart';
import 'package:e_commerce_app/models/product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class QuantityCounter extends StatefulWidget {
  const QuantityCounter({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int _quantity = 1;
  void add() {
    setState(() {
      _quantity += 1;
    });
  }

  void remove() {
    setState(() {
      if (_quantity <= 1) return;
      _quantity -= 1;
    });
  }

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
            "$_quantity",
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
