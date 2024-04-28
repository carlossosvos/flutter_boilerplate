import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/shared/core/utils/constants.dart';
import 'package:flutter_boilerplate/shared/di/injection.dart';

import 'package:shared_preferences/shared_preferences.dart';

/// The `AppThemeCubit` class in Dart is used to manage the application theme state and provides methods
/// to initialize and change the theme.
class AppThemeCubit extends Cubit<bool> {
  AppThemeCubit() : super(true) {
    initialize();
  }

  /// The `initialize` function in Dart is an asynchronous function that does not return any value.
  Future<void> initialize() async {
    bool themeMode =
        getIt<SharedPreferences>().getBool(PreferencesConstants.themeKey) ??
            true;

    emit(themeMode);
  }

  /// The above function changes the theme by toggling the current state.
  Future<void> changeTheme() async {
    getIt<SharedPreferences>().setBool(PreferencesConstants.themeKey, !state);
    emit(!state);
  }
}
