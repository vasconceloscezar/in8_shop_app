import 'package:e_commerce_app/apis/e_commerce_api.dart';
import 'package:e_commerce_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  User? _currentUser;
  String? accessToken = '';
  bool logged = false;

  final ApiIN8 _api = ApiIN8();

  get currentUser => _currentUser;
  set currentUser(user) => _currentUser = user;

  loadPersistedData() async {
    final prefs = await SharedPreferences.getInstance();
    var persistedUserName = prefs.getString('userName') ?? '';
    var persistedUserEmail = prefs.getString('userEmail') ?? '';
    var persistedAccessToken = prefs.getString('accessToken') ?? '';
    if (persistedAccessToken.length > 5) {
      _currentUser = User(email: persistedUserName, name: persistedUserEmail);
      accessToken = persistedAccessToken;
      logged = true;
    } else {
      logged = false;
    }
  }

  String getUserName() {
    if (logged && _currentUser != null) {
      return _currentUser!.name;
    }
    return 'Sem Nome.';
  }

  bool isUserLoggedIn() {
    if (accessToken != '' && logged) return true;
    return false;
  }

  persistUserData(String name, String email, String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('userEmail', email);
    await prefs.setString('accessToken', accessToken);
  }

  Future<bool> logIn(String email, String password) async {
    var result = await _api.login(email, password);
    if (result.accessToken.length > 5) {
      logged = true;
      accessToken = result.accessToken;
      _currentUser = User(email: email, name: result.name);
      persistUserData(result.name, email, result.accessToken);
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
      persistUserData(result.name, email, result.accessToken);
      return true;
    }
    return false;
  }

  logOff() {
    _currentUser = null;
    logged = false;
    accessToken = '';
  }
}
