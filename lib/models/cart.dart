import 'product.dart';

class Cart {
  List<CartItem> cartItems = [];
  int totalItems = 0;
  double totalPrice = 0;
  Cart(
      {required this.cartItems,
      required this.totalPrice,
      required this.totalItems});
}

class CartItem {
  final Product product;
  final int quantity;
  final double totalItemPrice;

  CartItem({required this.product, this.quantity = 0, this.totalItemPrice = 0});
}
