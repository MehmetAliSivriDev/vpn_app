import 'package:flutter/material.dart';
import 'package:vpn_app/product/constant/product_border_radius.dart';
import 'package:vpn_app/product/constant/product_padding.dart';
import 'package:vpn_app/product/constant/product_strings.dart';

class ProductInputDecoration extends InputDecoration {
  ProductInputDecoration.searchIDecoration()
    : super(
        hintText: ProductStrings.searchText,
        border: OutlineInputBorder(
          borderRadius: ProductBorderRadius.mainBorderRadius(),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: ProductPadding.allMedium(),
      );
}
