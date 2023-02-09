import 'package:e_commerce_app/components/cart_button.dart';
import 'package:e_commerce_app/components/product_discount.dart';
import 'package:e_commerce_app/components/product_image.dart';
import 'package:e_commerce_app/components/product_price.dart';
import 'package:e_commerce_app/models/cart.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce_app/screens/details/details_screen.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRatio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context, listen: true);
    void addProductToCart() {
      var quantityDefault = 1;
      var totalItemPrice = product.price * quantityDefault;

      if (product.hasDiscount) {
        totalItemPrice = product.priceWithDiscount * quantityDefault;
      }
      var cartItem = CartItem(
          product: product,
          quantity: quantityDefault,
          totalItemPrice: totalItemPrice);
      cartProvider.addItem(cartItem);
    }

    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: product),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: ProductImage(imageURL: product.images[0])),
              SizedBox(height: getProportionateScreenHeight(20)),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductPrice(
                        price: product.price, hasDiscount: product.hasDiscount),
                    ProductDiscount(
                        price: product.price,
                        priceWithDiscount: product.priceWithDiscount,
                        hasDiscount: product.hasDiscount),
                    CartButton(onAddToCart: addProductToCart)
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
