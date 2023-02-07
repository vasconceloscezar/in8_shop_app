import 'package:e_commerce_app/models/cart.dart';
import 'package:e_commerce_app/models/user.dart';

class Purchase {
  String id;
  double totalPrice;
  int totalItems;
  DateTime date;
  Purchase(
      {required this.id,
      required this.totalPrice,
      required this.totalItems,
      required this.date});
}
