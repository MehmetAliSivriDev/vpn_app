import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/core/model/connection_stats_model.dart';
import 'package:vpn_app/core/model/country_model.dart';
import 'package:vpn_app/core/service/vpn_repository.dart';
import 'package:vpn_app/core/service/vpn_service.dart';
import 'package:vpn_app/features/home/viewModel/home_state.dart';
import 'package:vpn_app/product/constant/product_colors.dart';
import 'package:vpn_app/product/constant/product_padding.dart';
import 'package:vpn_app/product/util/custom_exception.dart';
import 'package:vpn_app/product/util/custom_snackbar.dart';

class HomeViewModel extends GetxController {
  final state = HomeState();
  VpnRepository repository = VpnService();
  final searchController = TextEditingController();
  Timer? connectedTimer;

  void changeLoading() {
    state.isLoading.value = !state.isLoading.value;

    if (state.isLoading.value) {
      if (!Get.isDialogOpen!) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.dialog(
            Center(
              child: Card(
                child: Padding(
                  padding: const ProductPadding.allHigh30(),
                  child: CircularProgressIndicator(
                    color: ProductColors.instance.mainColor,
                  ),
                ),
              ),
            ),
            barrierDismissible: false,
          );
        });
      }
    } else {
      if (Get.isDialogOpen!) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.back();
        });
      }
    }
  }

  Future<void> getCountries({bool useMockData = true}) async {
    try {
      changeLoading();
      final response = await repository.getCountries(useMockData: useMockData);

      if (response != null && response.isNotEmpty) {
        state.countries.value = response;
        state.countriesForSearch.assignAll(state.countries);
      }

      //Loading Ekranı gözükmesi için geçiçi bekletme normalde servis süresi beklenir
      //Bu işlem yapılmaz
      await Future.delayed(Duration(seconds: 1));
      changeLoading();
    } on CustomException catch (e) {
      CustomSnackbar.show(type: SnackbarType.error, content: e.message);
    }
  }

  Future<void> getConnectedCountryStats({
    required CountryModel country,
    bool useMockData = true,
  }) async {
    try {
      changeLoading();

      final response = await repository.getConnectionStats(
        useMockData: useMockData,
        country: country,
      );

      if (response != null) {
        state.currentConnectionStats.value = response;

        //Bu kod bloğu geçici olup gelen veriden de devam edillip gösterebilmek için koyulmuştur
        if (state.currentConnectionStats.value.connectedCountry != null &&
            state.currentConnectionStats.value.connectedCountry!.name !=
                "Netherlands") {
          state.currentConnectionStats.value.connectedTime = Duration.zero;
        }
        startTimer(
          state.currentConnectionStats.value.connectedTime ?? Duration.zero,
        );
      }
      //Loading Ekranı gözükmesi için geçiçi bekletme normalde servis süresi beklenir
      //Bu işlem yapılmaz
      await Future.delayed(Duration(seconds: 1));
      changeLoading();
    } on CustomException catch (e) {
      CustomSnackbar.show(type: SnackbarType.error, content: e.message);
    }
  }

  Future<void> unConnect() async {
    try {
      changeLoading();

      state.currentConnectionStats.value = ConnectionStatsModel();
      stopTimer();
      //Loading Ekranı gözükmesi için geçiçi bekletme normalde servis süresi beklenir
      //Bu işlem yapılmaz
      await Future.delayed(Duration(seconds: 1));
      changeLoading();
    } on CustomException catch (e) {
      CustomSnackbar.show(type: SnackbarType.error, content: e.message);
    }
  }

  void search(String searchQuery) {
    final query = searchQuery.trim().toLowerCase();

    if (query.isEmpty) {
      state.countriesForSearch.assignAll(state.countries);
      return;
    }

    final filtered =
        state.countries.where((country) {
          final name = (country.name ?? '').toLowerCase();
          return name.contains(query);
        }).toList();

    state.countriesForSearch.assignAll(filtered);
  }

  void startTimer(Duration startFrom) {
    connectedTimer?.cancel();
    state.connectedDuration.value = startFrom;

    connectedTimer = Timer.periodic(Duration(seconds: 1), (_) {
      state.connectedDuration.value += Duration(seconds: 1);
    });
  }

  void stopTimer() {
    connectedTimer?.cancel();
    connectedTimer = null;
  }

  @override
  Future<void> onInit() async {
    await getCountries();
    super.onInit();

    searchController.addListener(() {
      state.searchString.value = searchController.text;
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
