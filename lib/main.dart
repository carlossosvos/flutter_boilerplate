import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/config/flavors.dart';
import 'package:flutter_boilerplate/shared/presentation/cubits/locale_cubit.dart';
import 'package:flutter_boilerplate/shared/presentation/router/app_router.dart';
import 'package:flutter_boilerplate/initialize.dart';
import 'package:flutter_boilerplate/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_boilerplate/shared/di/injection.dart';
import 'package:flutter_boilerplate/shared/presentation/cubits/app_theme_cubit.dart';
import 'package:flutter_boilerplate/shared/presentation/theme/buttons.dart';
import 'package:flutter_boilerplate/shared/presentation/theme/inputs.dart';
import 'package:flutter_boilerplate/shared/presentation/theme/texts.dart';
import 'package:flutter_boilerplate/shared/presentation/theme/themes.dart';
import 'package:flutter_boilerplate/shared/presentation/widgets/molecules/flavor_banner.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

Future<void> main() async {
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
    // Create static router instance
    final router = AppRouter().getRouter;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AppThemeCubit(),
        ),
        BlocProvider(
          create: (_) => LocaleCubit(),
        ),
        BlocProvider(
          create: (_) => AuthCubit(
            authRepository: getIt<AuthRepository>(),
          )..checkAuthStatus(),
        )
      ],
      child: Builder(
        builder: (context) {
          final isLightTheme = context.watch<AppThemeCubit>().state;
          final selectedLocale = context.watch<LocaleCubit>().state;
          final currentTheme = isLightTheme ? lightTheme : darkTheme;

          return Directionality(
            textDirection: TextDirection.ltr,
            child: FlavorBanner(
              flavor: F.name,
              child: MaterialApp.router(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                locale: selectedLocale,
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                routerConfig: router, // Use cached router instance
                title: F.title,
                //themeMode: themeState,
                theme: currentTheme.copyWith(
                  textTheme: createTextTheme(
                      context, "Advent Pro", "Advent Pro", currentTheme),
                  inputDecorationTheme: InputTheme().inputTheme(currentTheme),
                  elevatedButtonTheme:
                      createElevatedButtonThemeData(currentTheme),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
