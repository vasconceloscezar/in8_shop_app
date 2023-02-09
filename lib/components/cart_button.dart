import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key, required this.onAddToCart});
  final Function onAddToCart;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () => onAddToCart(),
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(5)),
        height: getProportionateScreenWidth(28),
        width: getProportionateScreenWidth(28),
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          "assets/icons/Cart_Icon.svg",
          color: const Color(0xFFFF4848),
        ),
      ),
    );
  }
}
