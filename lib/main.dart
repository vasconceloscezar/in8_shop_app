import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/purchases_provider.dart';
import 'package:e_commerce_app/providers/user_provider.dart';
import 'package:e_commerce_app/routes.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:e_commerce_app/screens/splash/splash_screen.dart';
import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:e_commerce_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
            create: (context) => ProductProvider()),
        ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<PurchasesProvider>(
            create: (context) => PurchasesProvider())
      ],
      child: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return FutureBuilder(
            future: userProvider.loadPersistedData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final user = userProvider;
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'IN8 Shop',
                  theme: theme(),
                  initialRoute: user.isUserLoggedIn()
                      ? HomeScreen.routeName
                      : SplashScreen.routeName,
                  routes: routes,
                );
              }
              return Container();
            },
          );
        },
      ),
    );
  }
}
