import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/user_provider.dart';
import 'package:e_commerce_app/screens/checkout_success/checkout_success_screen.dart';
import 'package:e_commerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/components/default_button.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: true);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    void checkoutCart() async {
      if (!userProvider.isUserLoggedIn()) {
        Navigator.pushNamed(context, SignInScreen.routeName);
      } else {
        debugPrint('Buying items...');
        var bought = cartProvider.buyItems(
            userProvider.accessToken!, userProvider.currentUser);
        if (await bought) {
          cartProvider.clearCart();
          debugPrint('Items purchased.');
          Navigator.pushNamed(context, CheckoutSuccessScreen.routeName);
        }
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text:
                            "R\$ ${cartProvider.totalPrice > 0 ? cartProvider.totalPrice : 0}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Continuar",
                    press: () => checkoutCart(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
