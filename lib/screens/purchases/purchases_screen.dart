import 'package:e_commerce_app/providers/purchases_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class PurchaseScreen extends StatelessWidget {
  static String routeName = "/purchases";

  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final purchaseProvider =
        Provider.of<PurchasesProvider>(context, listen: true);

    return Scaffold(
      appBar: buildAppBar(context, purchaseProvider.totalPurchases),
      body: const Body(),
    );
  }

  AppBar buildAppBar(BuildContext context, int total) {
    return AppBar(
      title: Column(
        children: [
          const Text(
            "Suas compras",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${total > 0 ? total : 0} compras",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
