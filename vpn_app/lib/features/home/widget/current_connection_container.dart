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
import 'package:vpn_app/product/util/product_utils.dart';

class CurrentConnectionContainer extends StatelessWidget {
  const CurrentConnectionContainer({super.key, required this.controller});

  final HomeViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          controller.state.currentConnectionStats.value.connectedCountry == null
              ? _noConnectionContainer(context)
              : Column(
                children: [
                  _buildConnectingTime(context),
                  CustomSizedBox.getSmall025Seperator(context),
                  _buildCurrentConnectedCountry(context),
                  CustomSizedBox.getSmall015Seperator(context),
                  _buildDownloadAndUpload(context),
                ],
              ),
    );
  }

  Widget _noConnectionContainer(BuildContext context) {
    return Container(
      padding: ProductPadding.allMedium(),
      decoration: BoxDecoration(
        color: ProductColors.instance.mainColor.withValues(alpha: 0.12),
        borderRadius: ProductBorderRadius.circularMedium(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.wifi,
            color: ProductColors.instance.mainColor,
            size: context.sized.dynamicWidth(0.07),
          ),
          CustomSizedBox.getSmall0025HorizontalSeperator(context),
          Text(
            ProductStrings.conContainerLetsConText,
            style: AppTextStyles.titleMedium(
              context,
              color: ProductColors.instance.mainColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadAndUpload(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: context.sized.dynamicHeight(0.075),
        maxHeight: context.sized.dynamicHeight(0.1),
      ),
      child: SizedBox(
        width: context.sized.dynamicWidth(0.75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildConnectionSpeedContainer(context: context, isDownload: true),
            _buildConnectionSpeedContainer(context: context, isDownload: false),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectionSpeedContainer({
    required BuildContext context,
    required bool isDownload,
  }) {
    return Container(
      padding: ProductPadding.allLow(),
      width: context.sized.dynamicWidth(0.36),
      decoration: ProductBoxDecoration.homeContainerDecoration(),
      child: Row(
        children: [
          Card(
            color:
                isDownload
                    ? ProductColors.instance.green.withValues(alpha: 0.15)
                    : ProductColors.instance.red.withValues(alpha: 0.15),
            elevation: 0,
            child: Padding(
              padding: const ProductPadding.allLow5(),
              child: SvgPicture.asset(
                isDownload ? SVGs.download.path : SVGs.upload.path,
                width: context.sized.dynamicWidth(0.06),
                height: context.sized.dynamicWidth(0.06),
              ),
            ),
          ),
          CustomSizedBox.getSmall0015HorizontalSeperator(context),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isDownload
                    ? "${ProductStrings.conContainerDownload} :"
                    : "${ProductStrings.conContainerUpload} :",
                style: AppTextStyles.bodySmall(
                  context,
                  color: ProductColors.instance.black.withValues(alpha: 0.4),
                ),
              ),
              Text(
                "${isDownload ? controller.state.currentConnectionStats.value.downloadSpeed : controller.state.currentConnectionStats.value.uploadSpeed} MB",
                style: AppTextStyles.bodyMedium(
                  context,
                  fontWeight: FontWeight.w500,
                  color: ProductColors.instance.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentConnectedCountry(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: context.sized.dynamicHeight(0.075),
        maxHeight: context.sized.dynamicHeight(0.1),
      ),
      child: Container(
        width: context.sized.dynamicWidth(0.75),
        decoration: ProductBoxDecoration.homeContainerDecoration(),
        child: Padding(
          padding: const ProductPadding.allLow(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    controller
                            .state
                            .currentConnectionStats
                            .value
                            .connectedCountry
                            ?.flag ??
                        "",
                  ),
                  CustomSizedBox.getSmall0025HorizontalSeperator(context),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller
                                .state
                                .currentConnectionStats
                                .value
                                .connectedCountry
                                ?.name ??
                            "",
                        style: AppTextStyles.titleSmall(
                          context,
                          color: ProductColors.instance.black,
                        ),
                      ),
                      Text(
                        controller
                                .state
                                .currentConnectionStats
                                .value
                                .connectedCountry
                                ?.city ??
                            "",
                        style: AppTextStyles.bodySmall(
                          context,
                          color: ProductColors.instance.black.withValues(
                            alpha: 0.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    ProductStrings.conContainerStrength,
                    style: AppTextStyles.bodySmall(
                      context,
                      color: ProductColors.instance.black.withValues(
                        alpha: 0.4,
                      ),
                    ),
                  ),
                  Text(
                    "${controller.state.currentConnectionStats.value.connectedCountry?.strength}%",
                    style: AppTextStyles.bodyMedium(
                      context,
                      fontWeight: FontWeight.w500,
                      color: ProductColors.instance.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConnectingTime(BuildContext context) {
    return Column(
      children: [
        Text(
          ProductStrings.conContainerTimeText,
          style: AppTextStyles.bodyMedium(context),
        ),
        Text(
          ProductUtils.formatDuration(controller.state.connectedDuration.value),

          style: AppTextStyles.headlineMedium(
            context,

            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
