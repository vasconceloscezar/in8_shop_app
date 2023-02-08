import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: true);
    return Scaffold(
      appBar: buildAppBar(context, cart.totalItems),
      body: const Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context, int totalItems) {
    return AppBar(
      title: Column(
        children: [
          const Text(
            "Seu Carrinho",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${totalItems > 0 ? totalItems : 0} itens",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
