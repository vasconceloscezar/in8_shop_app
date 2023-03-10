import 'package:e_commerce_app/models/cart.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/purchase.dart';
import 'package:e_commerce_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiIN8 {
  //When running on localhost, the IP inside the emulator
  //must be 10.0.2.2
  // String apiURL = 'http://10.0.2.2:3000/api';
  String apiURL = 'https://in8-shop-api.onrender.com/api';

  Product convertProductFromJson(Map<String, dynamic> json) {
    var discountValue = double.parse(json['discountValue'].toString());
    var price = double.parse(json['price'].toString());
    return Product(
        id: json['id'],
        name: json['name'],
        price: price,
        images: json['images'] != null ? List.from(json['images']) : [],
        colors: [],
        priceWithDiscount: price - (price * discountValue),
        description: json['description'],
        hasDiscount: json['hasDiscount'] ? true : false,
        discountValue: discountValue);
  }

  Future<List<Product>> loadAllProducts(ProductFilters filters) async {
    var filtersUrl = makeProductFiltersURL(filters);
    var productsURL = Uri.parse('$apiURL/products$filtersUrl');
    final response = await http.get(productsURL);
    if (response.statusCode == 200) {
      final productsJson = json.decode(response.body);
      debugPrint('Loaded ${productsJson['products'].length} products');

      var parsedProducts = productsJson['products']
          .map((productJson) => convertProductFromJson(productJson));
      return parsedProducts.cast<Product>().toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Purchase convertPurchaseFromJson(Map<String, dynamic> json) {
    return Purchase(
        id: json['id'],
        totalItems: int.parse(json['cart']['totalItems'].toString()),
        totalPrice: double.parse(json['cart']['totalPrice'].toString()),
        date: DateTime.parse(json['purchaseDate']));
  }

  Future<List<Purchase>> loadAllPurchases(String accessToken) async {
    final headers = {
      'Content-Type': 'application/json',
      'x-access-token': accessToken,
    };

    var purchasesURL = Uri.parse('$apiURL/purchases');

    final response = await http.get(purchasesURL, headers: headers);
    if (response.statusCode == 200) {
      final purchasesJson = json.decode(response.body);
      var parsedPurchases = purchasesJson['purchases']
          .map((purchasesJson) => convertPurchaseFromJson(purchasesJson));
      return parsedPurchases.cast<Purchase>().toList();
    } else {
      throw Exception('Failed to load purchases');
    }
  }

  String makeProductFiltersURL(ProductFilters filters) {
    var filterURL = '?limit=300&';
    if (filters.id != '') {
      filterURL += 'id=${filters.id}&';
    }
    if (filters.name != '') {
      filterURL += 'name=${filters.name}&';
    }
    if (filters.category != '') {
      filterURL += 'category=${filters.category}';
    }
    return filterURL;
  }

  Future<LoginData> signUp(User userData, String password) async {
    var signUpURL = Uri.parse('$apiURL/signup');
    final response = await http.post(signUpURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': userData.name,
          'email': userData.email,
          'password': password,
        }));
    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      return LoginData(name: data['name'], accessToken: data['accessToken']);
    } else if (response.statusCode >= 400 && response.statusCode <= 403) {
      throw Exception(data['error']);
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception('Failed to sign up');
    }
  }

  Future<LoginData> login(String email, String password) async {
    var signUpURL = Uri.parse('$apiURL/login');
    final response = await http.post(signUpURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }));
    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      return LoginData(name: data['name'], accessToken: data['accessToken']);
    } else if (response.statusCode == 401) {
      throw Exception('Email ou senha incorretos.');
    } else if (response.statusCode == 400) {
      throw Exception(data['error']);
    } else {
      throw Exception('Confira suas credenciais, problema ao logar.');
    }
  }

  Future<bool> purchase(Cart cart, User user, String accessToken) async {
    var purchaseURL = Uri.parse('$apiURL/purchase');

    final cartItems = cart.cartItems
        .map((cartItem) => {
              "product": {
                "id": cartItem.product.id,
                "name": cartItem.product.name,
                "price": cartItem.product.price,
                "imageURL": cartItem.product.images[0]
              },
              "price": cartItem.product.price,
              "quantity": cartItem.quantity
            })
        .toList();

    final body = json.encode({
      "cart": {
        "items": cartItems,
        "totalItems": cart.totalItems,
        "totalPrice": cart.totalPrice
      },
      "user": {"name": user.name, "email": user.email}
    });
    final headers = {
      'Content-Type': 'application/json',
      'x-access-token': accessToken,
    };
    final response = await http.post(purchaseURL, body: body, headers: headers);
    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}

class LoginData {
  String name;
  String accessToken;
  LoginData({required this.name, required this.accessToken});
}

class ProductFilters {
  String? name;
  String? id;
  String? category;

  ProductFilters({this.name = '', this.id = '', this.category = ''});
}
