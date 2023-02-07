import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/purchase.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

class PurchaseRow extends StatelessWidget {
  const PurchaseRow({
    Key? key,
    required this.purchase,
  }) : super(key: key);

  final Purchase purchase;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "R\$${purchase.totalPrice.toString()}",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                fontWeight: FontWeight.w600,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(width: getProportionateScreenWidth(15)),
            Text(
              "${purchase.totalItems.toString()} itens",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                fontWeight: FontWeight.w600,
                color: kSecondaryColor,
              ),
            ),
            SizedBox(width: getProportionateScreenWidth(30)),
            const SizedBox(height: 10),
            Text(
              purchase.date.toString().substring(0, 16),
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
              ),
            ),
          ],
        )
      ],
    );
  }
}
