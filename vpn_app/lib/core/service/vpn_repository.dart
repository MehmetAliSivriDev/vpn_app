import 'package:vpn_app/core/model/connection_stats_model.dart';
import 'package:vpn_app/core/model/country_model.dart';

abstract class VpnRepository {
  Future<List<CountryModel>?> getCountries({bool useMockData = false});
  Future<ConnectionStatsModel?> getConnectionStats({
    bool useMockData = false,
    required CountryModel country,
  });
}
