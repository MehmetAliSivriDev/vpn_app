import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/features/home/view/home_view.dart';
import 'package:vpn_app/features/settings/view/settings_view.dart';

class NavigationState {
  RxInt currentIndex = 0.obs;

  List<Widget> pages = [HomeView(), HomeView(), SettingsView()];
}
