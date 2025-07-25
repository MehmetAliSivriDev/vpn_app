import 'package:flutter/material.dart';

class ProductPadding extends EdgeInsets {
  //All
  const ProductPadding.allLow5() : super.all(5);
  const ProductPadding.allLow() : super.all(10);
  const ProductPadding.allMedium() : super.all(15);
  const ProductPadding.allHigh() : super.all(20);
  const ProductPadding.allHigh30() : super.all(30);

  //Symmetric
  const ProductPadding.horizontalLow() : super.symmetric(horizontal: 10);
  const ProductPadding.horizontalMedium() : super.symmetric(horizontal: 15);
  const ProductPadding.horizontalHigh() : super.symmetric(horizontal: 20);
  const ProductPadding.horizontalHigh30() : super.symmetric(horizontal: 30);
}
