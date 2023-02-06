import 'dart:collection';

import 'package:e_commerce_app/apis/e_commerce_api.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  final ApiIN8 _api = ApiIN8();

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  void addProducts(List<Product> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> fetchProducts(ProductFilters filters) async {
    final products = await _api.loadAllProducts(filters);
    _products = products;
    notifyListeners();
  }
}
