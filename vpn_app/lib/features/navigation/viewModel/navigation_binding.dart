import 'package:get/get.dart';
import 'package:vpn_app/features/home/viewModel/home_binding.dart';
import 'package:vpn_app/features/navigation/viewModel/navigation_view_model.dart';
import 'package:vpn_app/features/settings/viewModel/settings_binding.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationViewModel());
    HomeBinding().dependencies();
    SettingsBinding().dependencies();
  }
}
