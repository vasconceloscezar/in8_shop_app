import 'product.dart';

class Cart {
  final List<CartItem> cartItems = [];
  int totalItems = 0;
  double totalPrice = 0;
}

class CartItem {
  final Product product;
  final int quantity;
  final double totalItemPrice;

  CartItem({required this.product, this.quantity = 0, this.totalItemPrice = 0});
}
