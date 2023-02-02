import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiIN8 {
  //When running on localhost, the IP inside the emulator
  //must be 10.0.2.2
  String apiURL = 'http://10.0.2.2:3000/api';

  Product convertProductFromJson(Map<String, dynamic> json) {
    debugPrint(json['name']);
    return Product(
        id: json['id'],
        name: json['name'],
        price: double.parse(json['price'].toString()),
        images: json['images'] != null ? List.from(json['images']) : [],
        colors: [],
        description: json['description']);
  }

  Future<List<Product>> loadAllProducts() async {
    var productsURL = Uri.parse('$apiURL/products');
    final response = await http.get(productsURL);
    if (response.statusCode == 200) {
      final productsJson = json.decode(response.body);
      var parsedProducts = productsJson['products']
          .map((productJson) => convertProductFromJson(productJson));
      return parsedProducts.cast<Product>().toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<String> signUp(User userData) async {
    var signUpURL = Uri.parse('$apiURL/signup');
    final response = await http.post(signUpURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': userData.name,
          'email': userData.email,
          'password': userData.password,
        }));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      var accessToken = data['accessToken'];
      debugPrint(accessToken);
      return accessToken;
    } else if (response.statusCode == 401) {
      throw Exception(json.decode(response.body)['error']);
    } else {
      throw Exception('Failed to sign up');
    }
  }

  Future<String> login(User userData) async {
    var signUpURL = Uri.parse('$apiURL/login');
    final response = await http.post(signUpURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': userData.email,
          'password': userData.password,
        }));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      var accessToken = data['accessToken'];
      debugPrint(accessToken);
      return accessToken;
    } else if (response.statusCode == 401) {
      throw Exception('Invalid login credentials.');
    } else {
      throw Exception('Failed to login');
    }
  }
}
