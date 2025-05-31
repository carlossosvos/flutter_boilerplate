import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_boilerplate/shared/di/injection.dart';

/// The `LocaleCubit` class manages the application's locale state and allows for setting and loading
/// the locale using shared preferences.
class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(Locale('en')) {
    _loadLocale();
  }

  /// The function `_loadLocale` retrieves the saved locale code from SharedPreferences and emits a Locale
  /// object with the retrieved code or 'en' if not found.
  Future<void> _loadLocale() async {
    final prefs = getIt<SharedPreferences>();
    final localeCode = prefs.getString(PreferencesConstants.localeKey) ?? 'en';
    emit(Locale(localeCode));
  }

  /// The function `setLocale` sets the locale in SharedPreferences and emits the new locale.
  ///
  /// Args:
  ///   locale (Locale): The `locale` parameter is of type `Locale` and represents the locale that you
  /// want to set. It contains information such as the language code, country code, and other
  /// locale-specific details.
  Future<void> setLocale(Locale locale) async {
    final prefs = getIt<SharedPreferences>();
    await prefs.setString(PreferencesConstants.localeKey, locale.languageCode);
    emit(locale);
  }
}
