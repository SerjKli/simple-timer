import 'package:flutter/material.dart';

import 'color_schema.dart';

class ThemeService {
  final ThemeData themeMode;

  const ThemeService({
    required this.themeMode,
  });

  bool get _isDarkMode => themeMode == ThemeData.dark();

  AppColorScheme get _colorScheme =>
      !_isDarkMode ? AppColorScheme.lightMode : AppColorScheme.darkMode;

  ThemeData get themeData {
    TextTheme txtTheme = themeMode.textTheme
        .copyWith(
          bodySmall: const TextStyle(fontSize: 12),
          bodyLarge: const TextStyle(fontSize: 14),
          bodyMedium: const TextStyle(fontSize: 16),
          displayLarge: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )
        .apply(
          bodyColor: _colorScheme.dark,
          displayColor: _colorScheme.dark,
          fontFamily: "Roboto",
        );
    Color txtColor = txtTheme.bodySmall!.color!;

    ColorScheme colorScheme = ColorScheme(
      brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      primary: _colorScheme.brand!,
      secondary: _colorScheme.brand!,
      background: _colorScheme.bg!,
      surface: _colorScheme.bg!,
      onBackground: txtColor,
      onSurface: txtColor,
      onError: _colorScheme.light!,
      onPrimary: _colorScheme.light!,
      onSecondary: _colorScheme.light!,
      error: _colorScheme.error!,
    );

    /// Material color resolver
    MaterialStateProperty<Color?> colorResolver(colorScheme) =>
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.brand!;
          }
          return null;
        });

    return ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme)
        .copyWith(
      highlightColor: _colorScheme.brand!,
      extensions: <ThemeExtension<dynamic>>[_colorScheme],
      checkboxTheme: CheckboxThemeData(
        fillColor: colorResolver(_colorScheme),
      ),
      radioTheme: RadioThemeData(
        fillColor: colorResolver(_colorScheme),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: colorResolver(_colorScheme),
        trackColor: colorResolver(_colorScheme),
      ),
    );
  }
}
