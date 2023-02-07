import 'package:e_commerce_app/providers/purchases_provider.dart';
import 'package:e_commerce_app/providers/user_provider.dart';
import 'package:e_commerce_app/screens/purchases/components/purchase_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final accessToken =
        Provider.of<UserProvider>(context, listen: true).accessToken!;
    final purchasesProvider =
        Provider.of<PurchasesProvider>(context, listen: true);
    purchasesProvider.fetchPurchases(accessToken);

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: purchasesProvider.purchases.isEmpty
          ? Container()
          : ListView.builder(
              itemCount: purchasesProvider.purchases.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: PurchaseRow(
                      purchase: purchasesProvider.getPurchase(index),
                    ));
              },
            ),
    );
  }
}
