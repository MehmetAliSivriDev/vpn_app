import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vpn_app/core/model/connection_stats_model.dart';
import 'package:vpn_app/core/model/country_model.dart';
import 'package:vpn_app/core/service/vpn_repository.dart';
import 'package:vpn_app/product/constant/product_strings.dart';
import 'package:vpn_app/product/network/product_network_manager.dart';
import 'package:vpn_app/product/util/custom_exception.dart';
import 'package:http/http.dart' as http;

class VpnService implements VpnRepository {
  final mockCountries = [
    CountryModel(
      name: 'Italy',
      flag: 'assets/flags/italy.png',
      city: '',
      locationCount: 4,
      strength: 70,
    ),
    CountryModel(
      name: 'Netherlands',
      flag: 'assets/flags/netherlands.png',
      city: 'Amsterdam',
      locationCount: 12,
      strength: 85,
    ),
    CountryModel(
      name: 'Germany',
      flag: 'assets/flags/germany.png',
      city: '',
      locationCount: 10,
      strength: 90,
    ),
  ];

  ConnectionStatsModel mockConnectionStats({
    String countryName = "Netherlands",
  }) => ConnectionStatsModel(
    downloadSpeed: 527,
    uploadSpeed: 49,
    connectedTime: Duration(hours: 2, minutes: 41, seconds: 52),
    connectedCountry: mockCountries.firstWhere(
      (country) =>
          (country.name ?? '').toLowerCase() == countryName.toLowerCase(),
      orElse: () => mockCountries[1],
    ),
  );

  final timeoutDuration = Duration(seconds: 10);

  @override
  Future<List<CountryModel>?> getCountries({bool useMockData = false}) async {
    try {
      if (useMockData) {
        return mockCountries;
      } else {
        // Aşağıdaki servis kodu bir örnektir.
        // Backend servisine göre hareket edilir
        final response = await http
            .get(ProductNetworkManager.instance.sampleUri)
            .timeout(timeoutDuration);
        switch (response.statusCode) {
          case 200:
            final data = json.decode(response.body);
            if (data == null || data.isEmpty) return null;
            return data
                .map((country) => CountryModel.fromJson(country))
                .toList();
          case 500:
            throw CustomException(ProductStrings.errDataLoad);
          default:
            throw CustomException(ProductStrings.errUnknown);
        }
      }
    } on TimeoutException catch (e) {
      debugPrint(e.toString());
      throw CustomException(ProductStrings.errTime);
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw CustomException(ProductStrings.errOccured);
    }
  }

  @override
  Future<ConnectionStatsModel?> getConnectionStats({
    bool useMockData = false,
    required CountryModel country,
  }) async {
    try {
      if (useMockData) {
        return mockConnectionStats(countryName: country.name ?? "");
      } else {
        // Aşağıdaki servis kodu bir örnektir.
        // Backend servisine göre hareket edilir
        final response = await http
            .get(
              ProductNetworkManager.instance.sampleUriConnectionStats(
                country.name ?? "",
              ),
            )
            .timeout(timeoutDuration);
        switch (response.statusCode) {
          case 200:
            final data = json.decode(response.body);
            if (data == null || data.isEmpty) return null;
            return data
                .map((country) => ConnectionStatsModel.fromJson(country))
                .toList();
          case 500:
            throw CustomException(ProductStrings.errDataLoad);
          default:
            throw CustomException(ProductStrings.errUnknown);
        }
      }
    } on TimeoutException catch (e) {
      debugPrint(e.toString());
      throw CustomException(ProductStrings.errTime);
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw CustomException(ProductStrings.errOccured);
    }
  }
}
