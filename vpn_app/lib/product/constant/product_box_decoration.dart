import 'package:flutter/material.dart';
import 'package:vpn_app/product/constant/product_border_radius.dart';
import 'package:vpn_app/product/constant/product_colors.dart';

class ProductBoxDecoration extends BoxDecoration {
  ProductBoxDecoration.homeContainerDecoration()
    : super(
        color: ProductColors.instance.white,
        borderRadius: ProductBorderRadius.mainBorderRadius(),
        boxShadow: [
          BoxShadow(
            color: ProductColors.instance.black.withValues(alpha: 0.05),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      );
}
