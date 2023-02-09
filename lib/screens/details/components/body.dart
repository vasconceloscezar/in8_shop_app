import 'package:e_commerce_app/models/cart.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/components/default_button.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:provider/provider.dart';

import 'quantity_counter.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _quantity = 1;
  void add() {
    setState(() {
      _quantity += 1;
    });
  }

  void remove() {
    setState(() {
      if (_quantity <= 1) return;
      _quantity -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: true);

    void addProductToCart() {
      var totalItemPrice = widget.product.price * _quantity;
      if (widget.product.hasDiscount) {
        totalItemPrice = widget.product.priceWithDiscount * _quantity;
      }
      var cartItem = CartItem(
          product: widget.product,
          totalItemPrice: totalItemPrice,
          quantity: _quantity);
      cart.addItem(cartItem);
    }

    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
              ),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    QuantityCounter(
                      product: widget.product,
                      quantity: _quantity,
                      add: add,
                      remove: remove,
                    ),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                            text: "Comprar", press: () => addProductToCart()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
