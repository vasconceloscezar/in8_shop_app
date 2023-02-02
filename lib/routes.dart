import 'package:flutter/widgets.dart';
import 'package:e_commerce_app/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:e_commerce_app/screens/details/details_screen.dart';
import 'package:e_commerce_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:e_commerce_app/screens/login_success/login_success_screen.dart';
import 'package:e_commerce_app/screens/otp/otp_screen.dart';
import 'package:e_commerce_app/screens/profile/profile_screen.dart';
import 'package:e_commerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:e_commerce_app/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
};
