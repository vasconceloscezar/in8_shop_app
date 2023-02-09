import 'package:flutter/material.dart';

class Product {
  final String id, description, name;
  final List<String> images;
  final List<Color> colors;
  final double price, discountValue, priceWithDiscount;
  final bool hasDiscount, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    required this.description,
    required this.priceWithDiscount,
    required this.price,
    required this.name,
    this.discountValue = 0.0,
    this.hasDiscount = false,
    this.isPopular = false,
  });
}
