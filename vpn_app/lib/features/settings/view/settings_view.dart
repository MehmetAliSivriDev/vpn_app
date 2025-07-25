import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_app/core/util/app_text_styles.dart';
import 'package:vpn_app/features/settings/viewModel/settings_view_model.dart';
import 'package:vpn_app/product/constant/product_border_radius.dart';
import 'package:vpn_app/product/constant/product_box_decoration.dart';
import 'package:vpn_app/product/constant/product_colors.dart';
import 'package:vpn_app/product/constant/product_padding.dart';
import 'package:vpn_app/product/constant/product_strings.dart';
import 'package:vpn_app/product/extension/lottie_extension.dart';

class SettingsView extends GetView<SettingsViewModel> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ProductStrings.settingAppbarTitle,
          style: AppTextStyles.titleLarge(context),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: const ProductPadding.horizontalMedium(),
      child: Column(
        children: [
          Container(
            padding: ProductPadding.allLow(),
            decoration: ProductBoxDecoration.homeContainerDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildTitleAndSubtitle(context), _buildButton()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return InkWell(
      borderRadius: ProductBorderRadius.mainBorderRadius(),
      onTap: () {
        controller.changeTheme();
      },
      child: Lottie.asset(
        Lotties.lottie_theme_change.getPath,
        repeat: false,
        controller: controller.state.animationController,
      ),
    );
  }

  Widget _buildTitleAndSubtitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ProductStrings.settingThemeTitle,
          style: AppTextStyles.titleSmall(
            context,
            color: ProductColors.instance.black,
          ),
        ),
        Text(
          ProductStrings.settingThemeSubtitle,
          style: AppTextStyles.bodySmall(
            context,
            color: ProductColors.instance.black.withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }
}
