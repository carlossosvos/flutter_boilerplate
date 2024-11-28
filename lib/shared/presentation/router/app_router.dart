// lib/app_router.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/flavors.dart';
import 'package:flutter_boilerplate/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_boilerplate/auth/presentation/cubits/auth_state.dart';
import 'package:flutter_boilerplate/auth/presentation/pages/login_page.dart';
import 'package:flutter_boilerplate/auth/presentation/pages/register_page.dart';
import 'package:flutter_boilerplate/shared/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  //final _sectionNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter get getRouter => GoRouter(
        navigatorKey: _rootNavigatorKey,
        // Redirect logic based on authentication state
        redirect: (context, state) {
          final isLoggedIn = context.read<AuthCubit>().state is AuthSuccess;

          final isLoggingInOrRegistering =
              state.uri.path == '/login' || state.uri.path == '/register';

          if (!isLoggedIn && !isLoggingInOrRegistering) {
            return '/login'; // Redirect to login if not logged in
          }

          if (isLoggedIn && isLoggingInOrRegistering) {
            return '/'; // Redirect to home if already logged in
          }
          return null; // No redirect
        },

        routes: [
          //StatefulShellRoute.indexedStack(
          //  parentNavigatorKey: _sectionNavigatorKey,
          //  branches: [
          //    StatefulShellBranch(routes: [
          //      GoRoute(
          //        path: '/',
          //        builder: (_, __) => MyHomePage(
          //          title: F.appFlavor?.name ?? '',
          //        ),
          //      ),
          //    ])
          //  ],
          //),

          // Define your app routes here
          GoRoute(
            path: '/',
            builder: (_, __) => MyHomePage(
              title: F.appFlavor?.name ?? '',
            ),
          ),

          GoRoute(
            path: '/login',
            builder: (_, __) => LoginPage(),
          ),
          GoRoute(
            path: '/register',
            builder: (_, __) => RegisterPage(),
          ),
        ],
      );
}
