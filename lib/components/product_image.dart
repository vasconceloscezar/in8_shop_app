import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.imageURL,
  });
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  imageURL,
                ))));
  }
}
