import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kartal/kartal.dart';
import 'package:vpn_app/core/util/app_text_styles.dart';
import 'package:vpn_app/features/home/viewModel/home_view_model.dart';
import 'package:vpn_app/product/constant/product_border_radius.dart';
import 'package:vpn_app/product/constant/product_box_decoration.dart';
import 'package:vpn_app/product/constant/product_colors.dart';
import 'package:vpn_app/product/constant/product_padding.dart';
import 'package:vpn_app/product/constant/product_strings.dart';
import 'package:vpn_app/product/extension/svg_extension.dart';
import 'package:vpn_app/product/util/custom_sized_box.dart';

class Locations extends StatelessWidget {
  const Locations({super.key, required this.controller});

  final HomeViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => Padding(
          padding: const ProductPadding.horizontalHigh30(),
          child: Column(
            children: [
              _buildLocationsCountRow(context),
              CustomSizedBox.getSmall0005Seperator(context),
              _buildLocationsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationsList() {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) {
          return CustomSizedBox.getSmall01Seperator(context);
        },
        itemCount: controller.state.countries.length,
        itemBuilder: (context, index) {
          return _buildLocationContainer(context, index);
        },
      ),
    );
  }

  Widget _buildLocationContainer(BuildContext context, int index) {
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
              _buildCountryFlagAndInfo(index, context),
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
                    controller.state.countries[index].name) {
              controller.unConnect();
            } else {
              controller.getConnectedCountryStats(
                country: controller.state.countries[index],
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
                              controller.state.countries[index].name
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
                              controller.state.countries[index].name
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

  Widget _buildCountryFlagAndInfo(int index, BuildContext context) {
    return Row(
      children: [
        Image.asset(controller.state.countries[index].flag ?? ""),
        CustomSizedBox.getSmall0025HorizontalSeperator(context),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.state.countries[index].name ?? "",
              style: AppTextStyles.titleSmall(
                context,
                color: ProductColors.instance.black,
              ),
            ),
            Text(
              "${controller.state.countries[index].locationCount} ${ProductStrings.cContainerlocationsText}",
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

  Row _buildLocationsCountRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${ProductStrings.freeLocationsText} (${controller.state.countries.length})",
          style: AppTextStyles.bodySmall(
            context,
            // color: ProductColors.instance.black.withValues(alpha: 0.4),
          ),
        ),
        Icon(
          Icons.info,
          size: context.sized.dynamicWidth(0.05),
          color: ProductColors.instance.mGray,
        ),
      ],
    );
  }
}
