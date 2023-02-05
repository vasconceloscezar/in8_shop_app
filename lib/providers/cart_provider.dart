import 'dart:collection';

import 'package:e_commerce_app/models/cart.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];
  int _totalItems = 0;
  double _totalPrice = 0;

  List<CartItem> get cartItems => _cartItems;

  void addItem(CartItem value) {
    _cartItems.add(value);
    _totalItems = _cartItems.length;
    _totalPrice += value.totalItemPrice;
    notifyListeners();
  }

  CartItem getItem(int cartItemIndex) {
    return _cartItems[cartItemIndex];
  }

  void removeItem(int cartItemIndex) {
    CartItem provItem = _cartItems[cartItemIndex];
    _totalPrice -= provItem.totalItemPrice;
    _cartItems.removeAt(cartItemIndex);
    _totalItems = _cartItems.length;
    notifyListeners();
  }

  @override
  get totalItems => _totalItems;
  @override
  get totalPrice => _totalPrice;
}
