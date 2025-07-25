import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/core/theme/dark_theme.dart';
import 'package:vpn_app/core/theme/light_theme.dart';

class ThemeController extends GetxController {
  RxBool isLightTheme = true.obs;

  ThemeData get currentTheme =>
      isLightTheme.value
          ? LightTheme.instance.lightTheme
          : DarkTheme.instance.darkTheme;

  void changeTheme(bool isLight) {
    isLightTheme.value = isLight;
    Get.changeTheme(currentTheme);
  }
}
