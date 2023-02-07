import 'package:e_commerce_app/models/purchase.dart';
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "R\$${purchase.totalPrice.toString()}",
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
          ],
        )
      ],
    );
  }
}
