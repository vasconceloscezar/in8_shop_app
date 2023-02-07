import 'package:flutter/material.dart';

import 'components/body.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  static String routeName = "/checkout_success";

  const CheckoutSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Pedido efetuado!"),
      ),
      body: const Body(),
    );
  }
}
