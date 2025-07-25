import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextTheme _theme(BuildContext context) => context.general.textTheme;

  static final Map<String, double> _fontSizePercentages = {
    'displayLarge': 57 / 375,
    'displayMedium': 45 / 375,
    'displaySmall': 36 / 375,
    'headlineLarge': 32 / 375,
    'headlineMedium': 28 / 375,
    'headlineSmall': 24 / 375,
    'titleLarge': 22 / 375,
    'titleMedium': 16 / 375,
    'titleSmall': 14 / 375,
    'bodyLarge': 16 / 375,
    'bodyMedium': 14 / 375,
    'bodySmall': 12 / 375,
    'labelLarge': 14 / 375,
    'labelMedium': 12 / 375,
    'labelSmall': 11 / 375,
  };

  static double _responsiveFont(
    BuildContext context,
    String styleKey, {
    double minFactor = 0.85,
    double maxFactor = 1.25,
    bool applyTextScaleFactor = true,
  }) {
    final screenWidth = context.sized.width;
    final percentage = _fontSizePercentages[styleKey] ?? (14 / 375);
    final baseSize = 375 * percentage;
    final calculatedSize = screenWidth * percentage;
    final minSize = baseSize * minFactor;
    final maxSize = baseSize * maxFactor;

    double finalSize = calculatedSize.clamp(minSize, maxSize);

    if (applyTextScaleFactor) {
      final mediaQuery = MediaQueryData.fromView(View.of(context));
      final scale = mediaQuery.textScaler.scale(1.0);
      finalSize *= scale;
    }

    return finalSize;
  }

  static TextStyle _responsiveStyle(
    BuildContext context,
    String styleKey,
    TextStyle baseStyle, {
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    String? fontFamily,
  }) {
    final resolvedFontSize =
        fontSize ??
        _responsiveFont(
          context,
          styleKey,
          minFactor: minFontSizeFactor ?? 0.85,
          maxFactor: maxFontSizeFactor ?? 1.25,
        );

    return baseStyle.copyWith(
      fontSize: resolvedFontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
      fontFamily: fontFamily,
    );
  }

  static TextStyle _style(
    BuildContext context,
    String key,
    TextStyle? style, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _responsiveStyle(
    context,
    key,
    style!,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );

  static TextStyle displayLarge(
    BuildContext context, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _style(
    context,
    'displayLarge',
    _theme(context).displayLarge,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
  static TextStyle displayMedium(
    BuildContext context, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _style(
    context,
    'displayMedium',
    _theme(context).displayMedium,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
  static TextStyle displaySmall(
    BuildContext context, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _style(
    context,
    'displaySmall',
    _theme(context).displaySmall,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
  static TextStyle headlineLarge(
    BuildContext context, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _style(
    context,
    'headlineLarge',
    _theme(context).headlineLarge,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
  static TextStyle headlineMedium(
    BuildContext context, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _style(
    context,
    'headlineMedium',
    _theme(context).headlineMedium,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
  static TextStyle headlineSmall(
    BuildContext context, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _style(
    context,
    'headlineSmall',
    _theme(context).headlineSmall,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
  static TextStyle titleLarge(
    BuildContext context, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _style(
    context,
    'titleLarge',
    _theme(context).titleLarge,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
  static TextStyle titleMedium(
    BuildContext context, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _style(
    context,
    'titleMedium',
    _theme(context).titleMedium,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
  static TextStyle titleSmall(
    BuildContext context, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _style(
    context,
    'titleSmall',
    _theme(context).titleSmall,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
  static TextStyle bodyLarge(
    BuildContext context, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _style(
    context,
    'bodyLarge',
    _theme(context).bodyLarge,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
  static TextStyle bodyMedium(
    BuildContext context, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _style(
    context,
    'bodyMedium',
    _theme(context).bodyMedium,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
  static TextStyle bodySmall(
    BuildContext context, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _style(
    context,
    'bodySmall',
    _theme(context).bodySmall,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
  static TextStyle labelLarge(
    BuildContext context, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _style(
    context,
    'labelLarge',
    _theme(context).labelLarge,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
  static TextStyle labelMedium(
    BuildContext context, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _style(
    context,
    'labelMedium',
    _theme(context).labelMedium,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
  static TextStyle labelSmall(
    BuildContext context, {
    double? fontSize,
    double? minFontSizeFactor,
    double? maxFontSizeFactor,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _style(
    context,
    'labelSmall',
    _theme(context).labelSmall,
    fontSize: fontSize,
    minFontSizeFactor: minFontSizeFactor,
    maxFontSizeFactor: maxFontSizeFactor,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
}
