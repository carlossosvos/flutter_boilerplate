import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../di/injection.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(Locale('en')) {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final prefs = getIt<SharedPreferences>();
    final localeCode = prefs.getString(PreferencesConstants.localeKey) ?? 'en';
    emit(Locale(localeCode));
  }

  Future<void> setLocale(Locale locale) async {
    final prefs = getIt<SharedPreferences>();
    await prefs.setString(PreferencesConstants.localeKey, locale.languageCode);
    emit(locale);
  }
}
