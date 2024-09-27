import 'package:flutter_boilerplate/shared/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;
}

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
