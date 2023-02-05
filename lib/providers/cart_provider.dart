import 'package:e_commerce_app/models/cart.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];
  int _totalItems = 0;
  double _totalPrice = 0;

  List<CartItem> get cartItems => _cartItems;

  void addItem(CartItem value) {
    if (cartItemExistInList(value)) {
      var oldItem = _cartItems
          .where((CartItem item) => item.product.id == value.product.id)
          .toList()[0];
      _cartItems.removeWhere(
          (CartItem item) => item.product.id == oldItem.product.id);
      var updatedItem = CartItem(
        product: value.product,
        totalItemPrice: oldItem.totalItemPrice + value.totalItemPrice,
        quantity: oldItem.quantity + value.quantity,
      );
      _cartItems.add(updatedItem);
      _totalPrice += value.totalItemPrice;
      notifyListeners();
      return;
    }

    _cartItems.add(value);
    _totalItems = _cartItems.length;
    _totalPrice += value.totalItemPrice;
    notifyListeners();
  }

  CartItem getItem(int cartItemIndex) {
    return _cartItems[cartItemIndex];
  }

  void removeItem(int cartItemIndex) {
    CartItem itemToRemove = _cartItems[cartItemIndex];
    if (itemToRemove.product.id != '') {
      _totalPrice -= itemToRemove.totalItemPrice;
      _cartItems.removeAt(cartItemIndex);
      _totalItems = _cartItems.length;
    }
    notifyListeners();
  }

  bool cartItemExistInList(itemToAdd) {
    var cartItem = _cartItems
        .where((CartItem item) => item.product.id == itemToAdd.product.id);
    if (cartItem.isNotEmpty) return true;
    return false;
  }

  int get totalItems => _totalItems;
  double get totalPrice => _totalPrice;
}
