import 'package:flutter/material.dart';

class ProductColors {
  static ProductColors? _instance;
  static ProductColors get instance {
    _instance ??= ProductColors._init();
    return _instance!;
  }

  ProductColors._init();

  Color mainColor = Color(0xFF1A5CFF);
  Color backgroundColor = Color(0xFFF2F5F9);
  Color white = Color(0xFFFFFFFF);
  Color darkGray = Color(0xff333333);
  Color mGray = Color(0xff666666);
  Color ibBackgroundColor = Color(0xff3B74FF);
  Color black = Color(0xFF00091F);
  Color green = Color(0xff00D589);
  Color red = Color(0xffE63946);
  Color darkBackgroundColor = Color(0xFF0D1117);
  Color darkBNavigationBGColor = const Color(0xFF161B22);
}
