import 'package:flutter/material.dart';

class Product {
  final String id, description, name;
  final List<String> images;
  final List<Color> colors;
  final double price, discountValue;
  final bool hasDiscount, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    required this.description,
    required this.price,
    required this.name,
    this.discountValue = 0.0,
    this.hasDiscount = false,
    this.isPopular = false,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: '1',
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    name: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    discountValue: 4.8,
    isPopular: true,
  ),
  Product(
    id: '2',
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    name: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    discountValue: 4.1,
    isPopular: true,
  ),
  Product(
    id: '3',
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    name: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    discountValue: 4.1,
    isPopular: true,
  ),
  Product(
    id: '4',
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    name: "Logitech Head",
    price: 20.20,
    description: description,
    discountValue: 4.1,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
