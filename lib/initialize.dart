import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/env/env.dart';
import 'package:flutter_boilerplate/shared/di/injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    //DeviceOrientation.portraitDown,
  ]);

  await Supabase.initialize(
    url: Env.supabaseURL,
    anonKey: Env.supabaseAnonKey,
  );

  // configuring injections
  await configureDependencies();
}
