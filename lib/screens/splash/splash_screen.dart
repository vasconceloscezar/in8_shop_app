import 'package:e_commerce_app/apis/e_commerce_api.dart';
import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:e_commerce_app/providers/user_provider.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/screens/splash/components/body.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false)
        .fetchProducts(ProductFilters());
  }

  @override
  Widget build(BuildContext context) {
    // var userProvider = Provider.of<UserProvider>(context, listen: true);
    // userProvider.loadPersistedData();
    // if (userProvider.logged) {
    //   Navigator.pushNamed(context, HomeScreen.routeName);
    // }
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
