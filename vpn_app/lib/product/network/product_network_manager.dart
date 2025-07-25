class ProductNetworkManager {
  static ProductNetworkManager? _instance;
  static ProductNetworkManager get instance {
    _instance ??= ProductNetworkManager._init();
    return _instance!;
  }

  ProductNetworkManager._init();

  static const _BASEURL = "sample";

  //Product URIs will be here
  final sampleUri = Uri.parse("$_BASEURL/sample");

  Uri sampleUriConnectionStats(String countryName) =>
      Uri.parse("$_BASEURL/sample/$countryName");
}
