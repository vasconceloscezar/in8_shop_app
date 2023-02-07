import 'dart:collection';

import 'package:e_commerce_app/apis/e_commerce_api.dart';
import 'package:e_commerce_app/models/purchase.dart';
import 'package:flutter/cupertino.dart';

class PurchasesProvider with ChangeNotifier {
  List<Purchase> _purchases = [];
  int _totalPurchases = 0;
  final ApiIN8 _api = ApiIN8();

  UnmodifiableListView<Purchase> get purchases =>
      UnmodifiableListView(_purchases);
  get totalPurchases => _totalPurchases;

  Future<void> fetchPurchases(String accessToken) async {
    final purchases = await _api.loadAllPurchases(accessToken);
    _purchases = purchases;
    _totalPurchases = purchases.length;
    notifyListeners();
  }

  getPurchase(int index) {
    return _purchases[index];
  }
}
