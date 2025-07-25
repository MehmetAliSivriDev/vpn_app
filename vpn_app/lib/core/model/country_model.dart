class CountryModel {
  String? name;
  String? flag;
  String? city;
  int? locationCount;
  int? strength;
  bool? isConnected;

  CountryModel({
    this.name,
    this.flag,
    this.city,
    this.locationCount,
    this.strength,
    this.isConnected,
  });

  CountryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    flag = json['flag'];
    city = json['city'];
    locationCount = json['locationCount'];
    strength = json['strength'];
    isConnected = json['isConnected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['flag'] = this.flag;
    data['city'] = this.city;
    data['locationCount'] = this.locationCount;
    data['strength'] = this.strength;
    data['isConnected'] = this.isConnected;
    return data;
  }
}
