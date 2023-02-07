import 'package:flutter/material.dart';

import 'components/body.dart';

class PurchaseScreen extends StatelessWidget {
  static String routeName = "/purchases";

  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
