import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:vpn_app/features/home/viewModel/home_view_model.dart';
import 'package:vpn_app/features/navigation/viewModel/navigation_view_model.dart';
import 'package:vpn_app/product/constant/product_colors.dart';
import 'package:vpn_app/product/constant/product_strings.dart';
import 'package:vpn_app/product/extension/svg_extension.dart';

class NavigationView extends GetView<NavigationViewModel> {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeViewModel>();
    return Obx(
      () => Scaffold(
        bottomNavigationBar: _buildBottomNavigationBar(homeController, context),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (
        Widget child,
        Animation<double> primaryAnimation,
        Animation<double> secondaryAnimation,
      ) {
        return SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.vertical,
          child: child,
        );
      },
      child: KeyedSubtree(
        key: ValueKey<int>(controller.state.currentIndex.value),
        child: controller.state.pages[controller.state.currentIndex.value],
      ),
    );
  }

  Widget _buildBottomNavigationBar(
    HomeViewModel homeController,
    BuildContext context,
  ) {
    return BottomNavigationBar(
      currentIndex: controller.state.currentIndex.value,
      onTap: (index) {
        if (index == 1) {
          homeController.unConnect();
        } else {
          controller.changePage(index);
        }
      },
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            SVGs.map.path,
            colorFilter: ColorFilter.mode(
              controller.state.currentIndex.value == 0
                  ? ProductColors.instance.mainColor
                  : ProductColors.instance.darkGray,
              BlendMode.srcIn,
            ),
            width: context.sized.dynamicWidth(0.065),
            height: context.sized.dynamicWidth(0.065),
          ),
          label: ProductStrings.navigationCountriesText,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            SVGs.radar.path,
            colorFilter: ColorFilter.mode(
              controller.state.currentIndex.value == 1
                  ? ProductColors.instance.mainColor
                  : ProductColors.instance.darkGray,
              BlendMode.srcIn,
            ),
            width: context.sized.dynamicWidth(0.065),
            height: context.sized.dynamicWidth(0.065),
          ),
          label: ProductStrings.navigationDisconnectText,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            SVGs.setting.path,
            colorFilter: ColorFilter.mode(
              controller.state.currentIndex.value == 2
                  ? ProductColors.instance.mainColor
                  : ProductColors.instance.darkGray,
              BlendMode.srcIn,
            ),
            width: context.sized.dynamicWidth(0.065),
            height: context.sized.dynamicWidth(0.065),
          ),
          label: ProductStrings.navigationSettingText,
        ),
      ],
    );
  }
}
