import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:vpn_app/features/navigation/viewModel/navigation_state.dart';

class NavigationViewModel extends GetxController {
  final state = NavigationState();

  void changePage(int index) {
    state.currentIndex.value = index;
  }
}
