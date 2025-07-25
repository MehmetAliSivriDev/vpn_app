import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vpn_app/product/constant/product_colors.dart';

class DarkTheme {
  static DarkTheme? _instance;
  static DarkTheme get instance {
    _instance ??= DarkTheme._init();
    return _instance!;
  }

  DarkTheme._init();

  ThemeData get darkTheme => _theme;

  final ThemeData _theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ProductColors.instance.darkBackgroundColor,
    appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
    textTheme: TextTheme(
      bodySmall: TextStyle(color: ProductColors.instance.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ProductColors.instance.darkBNavigationBGColor,
      selectedItemColor: ProductColors.instance.mainColor,
      unselectedItemColor: ProductColors.instance.mGray,
      showUnselectedLabels: true,
    ),
  );
}
