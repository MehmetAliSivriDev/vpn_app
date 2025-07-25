import 'package:flutter/material.dart';

class ProductBorderRadius extends BorderRadius {
  ProductBorderRadius.mainBorderRadius() : super.circular(12);

  ProductBorderRadius.appBarContainerRadius()
    : super.only(
        bottomLeft: Radius.circular(32),
        bottomRight: Radius.circular(32),
      );

  //Circular
  ProductBorderRadius.circularLow() : super.circular(10);
  ProductBorderRadius.circularMedium() : super.circular(15);
  ProductBorderRadius.circularHigh() : super.circular(20);
  ProductBorderRadius.circularHigh30() : super.circular(30);
}
