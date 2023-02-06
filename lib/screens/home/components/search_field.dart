import 'package:e_commerce_app/apis/e_commerce_api.dart';
import 'package:e_commerce_app/components/text_field_debounced.dart';
import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context, listen: true);
    void searchProducts(String name) {
      var filters = ProductFilters(name: name);
      productProvider.fetchProducts(filters);
    }

    return Container(
      width: SizeConfig.screenWidth * 0.7,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFieldDebouced(
          hintText: "Procurar produto",
          debouncedCallback: (String value) => searchProducts(value)),
    );
  }
}
