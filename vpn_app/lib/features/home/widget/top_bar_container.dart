import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:vpn_app/core/routes/routes.dart';
import 'package:vpn_app/core/util/app_text_styles.dart';
import 'package:vpn_app/product/constant/product_border_radius.dart';
import 'package:vpn_app/product/constant/product_colors.dart';
import 'package:vpn_app/product/constant/product_padding.dart';
import 'package:vpn_app/product/constant/product_strings.dart';
import 'package:vpn_app/product/extension/svg_extension.dart';
import 'package:vpn_app/product/util/custom_sized_box.dart';

class TopBarContainer extends StatelessWidget {
  const TopBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildAppAndSearchBarContainer(context),
        _buildLeftShape(),
        _buildRightShape(),
      ],
    );
  }

  Widget _buildRightShape() {
    return Positioned(
      right: 0,
      top: 0,
      child: IgnorePointer(
        child: SvgPicture.asset(
          SVGs.right_frame.path,
          colorFilter: ColorFilter.mode(
            ProductColors.instance.backgroundColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  Widget _buildLeftShape() {
    return Positioned(
      left: 3,
      bottom: 3,
      child: IgnorePointer(
        child: SvgPicture.asset(
          SVGs.left_frame.path,
          colorFilter: ColorFilter.mode(
            ProductColors.instance.backgroundColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  Widget _buildAppAndSearchBarContainer(BuildContext context) {
    return Container(
      width: context.sized.dynamicWidth(1),
      height: context.sized.dynamicHeight(0.25),
      decoration: BoxDecoration(
        color: ProductColors.instance.mainColor,
        borderRadius: ProductBorderRadius.appBarContainerRadius(),
      ),
      child: Column(
        children: [
          CustomSizedBox.getMedium05Seperator(context),
          _buildAppBar(context),
          CustomSizedBox.getSmall025Seperator(context),
          _buildSearchBar(context),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.SEARCH);
      },
      child: Container(
        width: context.sized.dynamicWidth(0.8),
        height: context.sized.dynamicWidth(0.15),
        decoration: BoxDecoration(
          color: ProductColors.instance.backgroundColor,
          borderRadius: ProductBorderRadius.mainBorderRadius(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const ProductPadding.horizontalLow(),
              child: Text(
                ProductStrings.homeSearchBarText,
                style: AppTextStyles.bodySmall(
                  context,
                  color: ProductColors.instance.black.withValues(alpha: 0.4),
                ),
              ),
            ),
            Padding(
              padding: const ProductPadding.horizontalLow(),
              child: SvgPicture.asset(
                SVGs.search.path,
                colorFilter: ColorFilter.mode(
                  ProductColors.instance.darkGray,
                  BlendMode.srcIn,
                ),
                width: context.sized.dynamicWidth(0.075),
                height: context.sized.dynamicWidth(0.075),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCategoryButton(context),
        Text(
          ProductStrings.homeAppbarTitle,
          style: AppTextStyles.bodyLarge(
            context,
            color: ProductColors.instance.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        _buildPremiumButton(context),
      ],
    );
  }

  Widget _buildPremiumButton(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: ProductColors.instance.ibBackgroundColor,
          borderRadius: ProductBorderRadius.mainBorderRadius(),
        ),
        child: Padding(
          padding: const ProductPadding.allLow(),
          child: SvgPicture.asset(
            SVGs.crown.path,
            colorFilter: ColorFilter.mode(
              ProductColors.instance.white,
              BlendMode.srcIn,
            ),
            width: context.sized.dynamicWidth(0.075),
            height: context.sized.dynamicWidth(0.075),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: ProductColors.instance.ibBackgroundColor,
          borderRadius: ProductBorderRadius.mainBorderRadius(),
        ),
        child: Padding(
          padding: const ProductPadding.allLow(),
          child: SvgPicture.asset(
            SVGs.category.path,
            colorFilter: ColorFilter.mode(
              ProductColors.instance.white,
              BlendMode.srcIn,
            ),
            width: context.sized.dynamicWidth(0.075),
            height: context.sized.dynamicWidth(0.075),
          ),
        ),
      ),
    );
  }
}
