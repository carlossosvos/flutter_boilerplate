import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/flavors.dart';
import 'package:flutter_boilerplate/initialize.dart';
import 'package:flutter_boilerplate/shared/presentation/cubits/app_theme_cubit.dart';
import 'package:flutter_boilerplate/shared/presentation/pages/home_page.dart';
import 'package:flutter_boilerplate/shared/presentation/theme/themes.dart';

Future<void> main() async {
  F.appFlavor = Flavor.prod;
  runZonedGuarded(
    () async {
      await initialize();
      runApp(const MyApp());
    },
    (error, stack) {},
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppThemeCubit(),
      child: Builder(builder: (context) {
        final isLightTheme = context.watch<AppThemeCubit>().state;

        return MaterialApp(
          title: F.title,
          debugShowCheckedModeBanner: false,
          theme: isLightTheme ? lightTheme : darkTheme,
          home: MyHomePage(title: F.title),
        );
      }),
    );
  }
}
