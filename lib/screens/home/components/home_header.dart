import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/screens/cart/cart_screen.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context, listen: true);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          IconBtnWithCounter(
            backgroundColor: kSecondaryColor.withOpacity(0.1),
            svgSrc: "assets/icons/Cart_Icon.svg",
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
            numOfitem: cartProvider.totalItems,
          ),
        ],
      ),
    );
  }
}
