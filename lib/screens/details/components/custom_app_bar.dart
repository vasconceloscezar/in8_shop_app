import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/screens/home/components/icon_btn_with_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: true);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(10)),
        child: Row(
          children: [
            IconBtnWithCounter(
                backgroundColor: Colors.white,
                svgSrc: 'assets/icons/Back_Icon.svg',
                press: () => Navigator.pop(context)),
            const Spacer(),
            IconBtnWithCounter(
                backgroundColor: Colors.white,
                svgSrc: 'assets/icons/Cart_Icon.svg',
                press: () => Navigator.pushNamed(context, CartScreen.routeName),
                numOfitem: cart.totalItems)
          ],
        ),
      ),
    );
  }
}
