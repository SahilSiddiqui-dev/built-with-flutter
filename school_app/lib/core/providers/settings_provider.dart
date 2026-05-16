import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  final box = Hive.box('settings');
  final themeName = box.get('themeMode', defaultValue: 'light');
  return ThemeMode.values.firstWhere(
    (e) => e.name == themeName,
    orElse: () => ThemeMode.light,
  );
});

final localeProvider = StateProvider<Locale>((ref) {
  final box = Hive.box('settings');
  final languageCode = box.get('languageCode', defaultValue: 'en');
  return Locale(languageCode);
});

extension ThemeModeExtension on StateController<ThemeMode> {
  void updateThemeMode(ThemeMode mode) {
    state = mode;
    Hive.box('settings').put('themeMode', mode.name);
  }
}

extension LocaleExtension on StateController<Locale> {
  void updateLocale(Locale locale) {
    state = locale;
    Hive.box('settings').put('languageCode', locale.languageCode);
  }
}
