// ignore: constant_identifier_names
enum Lotties { lottie_theme_change }

extension LottieExtension on Lotties {
  String get getPath => "assets/lotties/$name.json";
}
