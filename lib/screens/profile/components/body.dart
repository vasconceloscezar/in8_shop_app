import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/purchases_provider.dart';
import 'package:e_commerce_app/providers/user_provider.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:e_commerce_app/screens/purchases/purchases_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context, listen: true);
    var cartProvider = Provider.of<CartProvider>(context, listen: true);
    var purchasesProvider =
        Provider.of<PurchasesProvider>(context, listen: true);
    ;
    void logOff() {
      userProvider.logOff();
      cartProvider.clearCart();
      Navigator.pushNamed(context, HomeScreen.routeName);
    }

    void goToPurchases() {
      purchasesProvider.fetchPurchases(userProvider.accessToken!);
      Navigator.pushNamed(context, PurchaseScreen.routeName);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          Text('Olá ${userProvider.getUserName()}'),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "Minha Conta",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Minhas Compras",
            icon: "assets/icons/Bill Icon.svg",
            press: () => goToPurchases(),
          ),
          ProfileMenu(
            text: "Deslogar",
            icon: "assets/icons/Log out.svg",
            press: () => logOff(),
          ),
        ],
      ),
    );
  }
}
