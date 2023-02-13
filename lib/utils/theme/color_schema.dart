import 'package:flutter/material.dart';

@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color? bg;
  final Color? brand;
  final Color? subBrand;
  final Color? success;
  final Color? error;
  final Color? light;
  final Color? dark;
  final Color? hint;
  final Color? black;
  final Color? bgGradientBegin;
  final Color? bgGradientEnd;
  final Color? shadow;

  const AppColorScheme({
    required this.bg,
    required this.brand,
    required this.subBrand,
    required this.success,
    required this.error,
    required this.light,
    required this.dark,
    required this.hint,
    required this.black,
    required this.bgGradientBegin,
    required this.bgGradientEnd,
    required this.shadow,
  });

  RadialGradient get bgGradient => RadialGradient(
        colors: [bgGradientBegin!, bgGradientEnd!],
      );

  @override
  AppColorScheme copyWith({
    Color? bg,
    Color? brand,
    Color? subBrand,
    Color? success,
    Color? error,
    Color? light,
    Color? dark,
    Color? hint,
    Color? black,
    Color? bgGradientBegin,
    Color? bgGradientEnd,
    Color? pageGradientBegin,
    Color? pageGradientEnd,
    Color? shadow,
  }) {
    return AppColorScheme(
      bg: bg ?? this.bg,
      brand: brand ?? this.brand,
      subBrand: subBrand ?? this.subBrand,
      success: success ?? this.success,
      error: error ?? this.error,
      light: light ?? this.light,
      dark: dark ?? this.dark,
      hint: hint ?? this.hint,
      black: black ?? this.black,
      bgGradientBegin: bgGradientBegin ?? this.bgGradientBegin,
      bgGradientEnd: bgGradientEnd ?? this.bgGradientEnd,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  AppColorScheme lerp(ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) {
      return this;
    }
    return AppColorScheme(
      bg: Color.lerp(bg, other.bg, t),
      brand: Color.lerp(brand, other.brand, t),
      subBrand: Color.lerp(subBrand, other.subBrand, t),
      success: Color.lerp(success, other.success, t),
      error: Color.lerp(error, other.error, t),
      light: Color.lerp(light, other.light, t),
      dark: Color.lerp(dark, other.dark, t),
      hint: Color.lerp(hint, other.hint, t),
      black: Color.lerp(black, other.black, t),
      bgGradientBegin: Color.lerp(bgGradientBegin, other.bgGradientBegin, t),
      bgGradientEnd: Color.lerp(bgGradientEnd, other.bgGradientEnd, t),
      shadow: Color.lerp(shadow, other.shadow, t),
    );
  }

  @override
  String toString() => 'Instance of "AppColorScheme"';

  /// Colors for light theme
  static const lightMode = AppColorScheme(
    bg: Color(0xff154377),
    brand: Color(0xffFFC905),
    subBrand: Color(0xffF6B321),
    success: Color(0xff8DA11D),
    error: Color(0xffED5B4E),
    light: Color(0xffffffff),
    dark: Color(0xff6C6C6C),
    hint: Color(0xffbebebe),
    black: Color(0xff000000),
    bgGradientBegin: Color(0xff154377),
    bgGradientEnd: Color(0xff59A4D0),
    shadow: Color(0xff252525),
  );

  /// Colors for dark theme
  static const darkMode = AppColorScheme(
    bg: Color(0xff154377),
    brand: Color(0xffFFC905),
    subBrand: Color(0xffF6B321),
    success: Color(0xff8DA11D),
    error: Color(0xffED5B4E),
    light: Color(0xffffffff),
    dark: Color(0xff6C6C6C),
    hint: Color(0xffbebebe),
    black: Color(0xff000000),
    bgGradientBegin: Color(0xff154377),
    bgGradientEnd: Color(0xff59A4D0),
    shadow: Color(0xffdadada),
  );
}
