import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/shared/presentation/cubits/locale_cubit.dart';
import 'package:flutter_boilerplate/shared/presentation/router/app_router.dart';
import 'package:flutter_boilerplate/flavors.dart';
import 'package:flutter_boilerplate/initialize.dart';
import 'package:flutter_boilerplate/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_boilerplate/shared/di/injection.dart';
import 'package:flutter_boilerplate/shared/presentation/cubits/app_theme_cubit.dart';
import 'package:flutter_boilerplate/shared/presentation/theme/buttons.dart';
import 'package:flutter_boilerplate/shared/presentation/theme/inputs.dart';
import 'package:flutter_boilerplate/shared/presentation/theme/texts.dart';
import 'package:flutter_boilerplate/shared/presentation/theme/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

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
            create: (_) => LocaleCubit(),
          ),
          BlocProvider(
            create: (_) => AuthCubit(authRepository: getIt<AuthRepository>())
              ..checkAuthStatus(),
          )
        ],
        child: Builder(builder: (context) {
          final theme =
              context.watch<AppThemeCubit>().state ? lightTheme : darkTheme;

          final textThene = createTextTheme(
            context,
            "Advent Pro",
            "Advent Pro",
            theme,
          );
          final elevatedButtonTheme = createElevatedButtonThemeData(theme);
          final selectedLocale = context.watch<LocaleCubit>().state;

          final inputTheme = InputTheme().inputTheme(theme);

          return MaterialApp.router(
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              locale: selectedLocale,
              supportedLocales: S.delegate.supportedLocales,
              routerConfig: AppRouter().getRouter,
              title: 'Flutter Boilerplate',
              theme: theme.copyWith(
                textTheme: textThene,
                inputDecorationTheme: inputTheme,
                elevatedButtonTheme: elevatedButtonTheme,
              ));
        }));
  }
}
