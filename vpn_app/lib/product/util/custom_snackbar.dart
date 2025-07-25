import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:vpn_app/core/util/app_text_styles.dart';
import 'package:vpn_app/product/constant/product_padding.dart';
import '../constant/product_colors.dart';

enum SnackbarType { error, success }

class CustomSnackbar {
  static void show({required SnackbarType type, required String content}) {
    final isError = type == SnackbarType.error;

    Get.snackbar(
      isError ? 'Hata' : 'Başarılı',
      "",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:
          isError ? ProductColors.instance.red : ProductColors.instance.green,
      colorText: ProductColors.instance.white,
      margin: ProductPadding.allLow5(),
      icon: Icon(
        isError ? Icons.error : Icons.check,
        color: ProductColors.instance.white,
        size: Get.context!.sized.dynamicWidth(0.06),
      ),
      messageText: Text(
        content,
        style: AppTextStyles.titleSmall(
          Get.context!,
          color: ProductColors.instance.white,
        ),
      ),
      duration: const Duration(milliseconds: 1500),
    );
  }
}
