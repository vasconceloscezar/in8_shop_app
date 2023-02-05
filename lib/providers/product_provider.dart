import 'dart:collection';

import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  void addProducts(List<Product> products) {
    _products = products;
    notifyListeners();
  }
}
