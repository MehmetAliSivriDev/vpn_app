import 'package:get/get.dart';
import 'package:vpn_app/core/model/connection_stats_model.dart';
import 'package:vpn_app/core/model/country_model.dart';

class HomeState {
  RxList<CountryModel> countries = <CountryModel>[].obs;
  RxList<CountryModel> countriesForSearch = <CountryModel>[].obs;
  RxBool isLoading = false.obs;
  Rx<ConnectionStatsModel> currentConnectionStats = ConnectionStatsModel().obs;
  Rx<Duration> connectedDuration = Duration.zero.obs;
  RxString searchString = "".obs;
}
