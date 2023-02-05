import 'package:e_commerce_app/models/cart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(3)),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(cartItem.product.images[0]),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartItem.product.name,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "R\$${cartItem.product.price}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x ${cartItem.quantity}",
                      style: Theme.of(context).textTheme.bodyText1),
                  TextSpan(
                      text: " = R\$${cartItem.totalItemPrice}",
                      style: Theme.of(context).textTheme.bodyText1)
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
