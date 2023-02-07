import 'package:e_commerce_app/apis/e_commerce_api.dart';
import 'package:e_commerce_app/models/cart.dart';
import 'package:e_commerce_app/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  User? _currentUser;
  String? accessToken = '';
  bool logged = false;
  String? routeBeforeLogin = '';

  final ApiIN8 _api = ApiIN8();

  get currentUser => _currentUser;
  set currentUser(user) => _currentUser = user;

  bool isUserLoggedIn() {
    if (accessToken != '' && logged) return true;
    return false;
  }

  setRouteBeforeLogin(String routeName) {
    routeBeforeLogin = routeName;
  }

  Future<bool> logIn(String email, String password) async {
    var result = await _api.login(email, password);
    if (result.accessToken.length > 5) {
      logged = true;
      accessToken = result.accessToken;
      _currentUser = User(email: email, name: result.name);
      return true;
    }
    return false;
  }

  Future<bool> signUp(String name, String email, String password) async {
    var userInfo = User(email: email, name: name);
    var result = await _api.signUp(userInfo, password);
    if (result.accessToken.length > 5) {
      logged = true;
      accessToken = result.accessToken;
      _currentUser = User(email: email, name: result.name);
      return true;
    }
    return false;
  }
}
