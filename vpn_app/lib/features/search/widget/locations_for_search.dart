import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kartal/kartal.dart';
import 'package:vpn_app/core/util/app_text_styles.dart';
import 'package:vpn_app/features/home/viewModel/home_view_model.dart';
import 'package:vpn_app/product/constant/product_border_radius.dart';
import 'package:vpn_app/product/constant/product_box_decoration.dart';
import 'package:vpn_app/product/constant/product_colors.dart';
import 'package:vpn_app/product/constant/product_padding.dart';
import 'package:vpn_app/product/extension/svg_extension.dart';
import 'package:vpn_app/product/util/custom_sized_box.dart';

class LocationsForSearch extends StatelessWidget {
  const LocationsForSearch({super.key, required this.controller});

  final HomeViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.zero,
          separatorBuilder: (context, index) {
            return CustomSizedBox.getSmall01Seperator(context);
          },
          itemCount: controller.state.countriesForSearch.length,
          itemBuilder: (context, index) {
            return _buildCountryContainer(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildCountryContainer(BuildContext context, int index) {
    return Obx(
      () => ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: context.sized.dynamicHeight(0.1),
        ),
        child: Container(
          padding: ProductPadding.allLow(),
          width: context.sized.dynamicWidth(1),
          decoration: ProductBoxDecoration.homeContainerDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildFlagAndInfoRow(index, context),
              _buildButtons(index, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(int index, BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            if (controller
                        .state
                        .currentConnectionStats
                        .value
                        .connectedCountry !=
                    null &&
                controller
                        .state
                        .currentConnectionStats
                        .value
                        .connectedCountry!
                        .name ==
                    controller.state.countriesForSearch[index].name) {
              controller.unConnect();
            } else {
              controller.getConnectedCountryStats(
                country: controller.state.countriesForSearch[index],
                useMockData: true,
              );
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color:
                  controller
                                  .state
                                  .currentConnectionStats
                                  .value
                                  .connectedCountry !=
                              null &&
                          controller
                                  .state
                                  .currentConnectionStats
                                  .value
                                  .connectedCountry!
                                  .name ==
                              controller.state.countriesForSearch[index].name
                      ? ProductColors.instance.mainColor
                      : ProductColors.instance.black.withValues(alpha: 0.06),
              borderRadius: ProductBorderRadius.circularHigh(),
            ),
            child: Padding(
              padding: ProductPadding.allLow5(),
              child: SvgPicture.asset(
                SVGs.open.path,
                colorFilter: ColorFilter.mode(
                  controller
                                  .state
                                  .currentConnectionStats
                                  .value
                                  .connectedCountry !=
                              null &&
                          controller
                                  .state
                                  .currentConnectionStats
                                  .value
                                  .connectedCountry!
                                  .name ==
                              controller.state.countriesForSearch[index].name
                      ? ProductColors.instance.white
                      : ProductColors.instance.black,
                  BlendMode.srcIn,
                ),
                width: context.sized.dynamicWidth(0.075),
                height: context.sized.dynamicWidth(0.075),
              ),
            ),
          ),
        ),
        CustomSizedBox.getSmall0015HorizontalSeperator(context),
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: ProductColors.instance.black.withValues(alpha: 0.06),
              borderRadius: ProductBorderRadius.circularHigh(),
            ),
            child: Padding(
              padding: ProductPadding.allLow5(),
              child: SvgPicture.asset(
                SVGs.arrow_right.path,
                colorFilter: ColorFilter.mode(
                  ProductColors.instance.black,
                  BlendMode.srcIn,
                ),
                width: context.sized.dynamicWidth(0.075),
                height: context.sized.dynamicWidth(0.075),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFlagAndInfoRow(int index, BuildContext context) {
    return Row(
      children: [
        Image.asset(controller.state.countriesForSearch[index].flag ?? ""),
        CustomSizedBox.getSmall0025HorizontalSeperator(context),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.state.countriesForSearch[index].name ?? "",
              style: AppTextStyles.titleSmall(context),
            ),
            Text(
              "${controller.state.countriesForSearch[index].locationCount} Locations",
              style: AppTextStyles.bodySmall(
                context,
                color: ProductColors.instance.black.withValues(alpha: 0.4),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
