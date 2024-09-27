import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app_router.dart';
import 'package:flutter_boilerplate/flavors.dart';
import 'package:flutter_boilerplate/initialize.dart';
import 'package:flutter_boilerplate/sample_feature/domain/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/sample_feature/presentation/cubits/auth_cubit.dart';
import 'package:flutter_boilerplate/shared/di/injection.dart';
import 'package:flutter_boilerplate/shared/presentation/cubits/app_theme_cubit.dart';
import 'package:flutter_boilerplate/shared/presentation/theme/themes.dart';

Future<void> main() async {
  F.appFlavor = Flavor.prod;
  runZonedGuarded(
    () async {
      await initialize();
      runApp(MyApp());
    },
    (error, stack) {},
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppThemeCubit(),
          ),
          BlocProvider(
            create: (_) => AuthCubit(authRepository: getIt<AuthRepository>()),
          )
        ],
        child: Builder(builder: (context) {
          final theme =
              context.watch<AppThemeCubit>().state ? lightTheme : darkTheme;

          return MaterialApp.router(
            routerConfig: AppRouter.router,
            title: 'GoRouter Authentication Example',
            theme: theme,
          );
        }));
  }
}
