import 'package:get/get.dart';
import 'package:vpn_app/core/routes/routes.dart';
import 'package:vpn_app/features/home/view/home_view.dart';
import 'package:vpn_app/features/home/viewModel/home_binding.dart';
import 'package:vpn_app/features/navigation/view/navigation_view.dart';
import 'package:vpn_app/features/navigation/viewModel/navigation_binding.dart';
import 'package:vpn_app/features/search/view/search_view.dart';
import 'package:vpn_app/features/settings/view/settings_view.dart';
import 'package:vpn_app/features/settings/viewModel/settings_binding.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.SEARCH,
      page: () => const SearchView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.SETTING,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
