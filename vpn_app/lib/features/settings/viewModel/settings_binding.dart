import 'package:get/get.dart';
import 'package:vpn_app/features/settings/viewModel/settings_view_model.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsViewModel());
  }
}
