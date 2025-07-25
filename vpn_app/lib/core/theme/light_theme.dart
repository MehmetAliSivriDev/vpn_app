import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vpn_app/product/constant/product_colors.dart';

class LightTheme {
  static LightTheme? _instance;
  static LightTheme get instance {
    _instance ??= LightTheme._init();
    return _instance!;
  }

  LightTheme._init();

  ThemeData get lightTheme => _theme;

  final ThemeData _theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ProductColors.instance.backgroundColor,
    appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: ProductColors.instance.black.withValues(alpha: 0.4),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ProductColors.instance.white,
      selectedItemColor: ProductColors.instance.mainColor,
      unselectedItemColor: ProductColors.instance.darkGray,
      showUnselectedLabels: true,
    ),
  );
}
