import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/core/theme/theme_controller.dart';
import 'package:vpn_app/features/settings/viewModel/settings_state.dart';

class SettingsViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  final state = SettingsState();
  final themeController = Get.find<ThemeController>();

  @override
  void onInit() {
    state.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.onInit();
  }

  void changeTheme() {
    state.isLight.value = !state.isLight.value;
    state.animationController.animateTo(state.isLight.value ? 0.0 : 0.5);
    themeController.changeTheme(state.isLight.value);
  }

  @override
  void onClose() {
    state.animationController.dispose();
    super.onClose();
  }
}
