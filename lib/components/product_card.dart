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
          child: Expanded(
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
                          price: product.price,
                          hasDiscount: product.hasDiscount),
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
        // Expanded(
        //     child: Align(
        //   alignment: Alignment.center,
        //   child: AspectRatio(
        //     aspectRatio: 4 / 3,
        //     child: Container(
        //       alignment: Alignment.center,
        //       margin: EdgeInsets.all(getProportionateScreenWidth(5)),
        //       decoration: BoxDecoration(
        //         color: kSecondaryColor.withOpacity(0.1),
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       child: Hero(
        //         tag: product.id.toString(),
        //         child: ClipRRect(
        //           borderRadius: BorderRadius.circular(8.0),
        //           child: Image.network(
        //             product.images[0],
        //             fit: BoxFit.fill,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // )),

        // SizedBox(height: getProportionateScreenHeight(20)),
        // Text(
        //   product.name,
        //   style: const TextStyle(color: Colors.black),
        //   maxLines: 1,
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       "R\$${product.price}",
        //       style: TextStyle(
        //         decoration: product.hasDiscount
        //             ? TextDecoration.lineThrough
        //             : TextDecoration.none,
        //         fontSize: product.hasDiscount
        //             ? getProportionateScreenWidth(14)
        //             : getProportionateScreenWidth(16),
        //         fontWeight: product.hasDiscount
        //             ? FontWeight.w400
        //             : FontWeight.w600,
        //         color: product.hasDiscount ? Colors.red : kPrimaryColor,
        //       ),
        //     ),
        //     Visibility(
        //         maintainSize: true,
        //         maintainState: true,
        //         maintainAnimation: true,
        //         visible: product.hasDiscount,
        //         child: Text(
        //           "R\$${product.price - (product.price * product.discountValue)}",
        //           style: TextStyle(
        //             fontSize: getProportionateScreenWidth(16),
        //             fontWeight: FontWeight.w600,
        //             color: kPrimaryColor,
        //           ),
        //         )),
        //     InkWell(
        //       borderRadius: BorderRadius.circular(50),
        //       onTap: () => addProductToCart(),
        //       child: Container(
        //         padding: EdgeInsets.all(getProportionateScreenWidth(5)),
        //         height: getProportionateScreenWidth(28),
        //         width: getProportionateScreenWidth(28),
        //         decoration: BoxDecoration(
        //           color: kSecondaryColor.withOpacity(0.1),
        //           shape: BoxShape.circle,
        //         ),
        //         child: SvgPicture.asset(
        //           "assets/icons/Cart_Icon.svg",
        //           color: const Color(0xFFFF4848),
        //         ),
        //       ),
        //     ),
        //   ],
        // )
      ),
    );
  }
}
