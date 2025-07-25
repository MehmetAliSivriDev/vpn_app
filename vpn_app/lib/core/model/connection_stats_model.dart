import 'package:vpn_app/core/model/country_model.dart';

class ConnectionStatsModel {
  int? downloadSpeed;
  int? uploadSpeed;
  Duration? connectedTime;
  CountryModel? connectedCountry;

  ConnectionStatsModel({
    this.downloadSpeed,
    this.uploadSpeed,
    this.connectedTime,
    this.connectedCountry,
  });

  ConnectionStatsModel.fromJson(Map<String, dynamic> json) {
    downloadSpeed = json['downloadSpeed'];
    uploadSpeed = json['uploadSpeed'];
    connectedTime =
        json['connectedTime'] != null
            ? Duration(milliseconds: json['connectedTime'])
            : null;
    connectedCountry =
        json['connectedCountry'] != null
            ? CountryModel.fromJson(json['connectedCountry'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['downloadSpeed'] = downloadSpeed;
    data['uploadSpeed'] = uploadSpeed;
    data['connectedTime'] = connectedTime?.inMilliseconds;
    data['connectedCountry'] = connectedCountry?.toJson();
    return data;
  }
}
