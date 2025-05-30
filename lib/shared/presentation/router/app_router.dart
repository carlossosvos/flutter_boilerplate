// lib/app_router.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/config/flavors.dart';
import 'package:flutter_boilerplate/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_boilerplate/features/auth/presentation/cubits/auth_state.dart';
import 'package:flutter_boilerplate/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_boilerplate/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_boilerplate/shared/presentation/pages/home_page.dart';
import 'package:flutter_boilerplate/shared/presentation/pages/profile_page.dart';
import 'package:flutter_boilerplate/shared/presentation/pages/settings_page.dart';
import 'package:flutter_boilerplate/shared/presentation/widgets/molecules/floating_nav_bar.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter get getRouter => GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: '/',
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
          GoRoute(
            path: '/login',
            builder: (_, __) => LoginPage(),
          ),
          GoRoute(
            path: '/register',
            builder: (_, __) => RegisterPage(),
          ),
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return Scaffold(
                extendBody: true, // Important for floating bar
                body: navigationShell,
                bottomNavigationBar: FloatingNavBar(
                  currentIndex: navigationShell.currentIndex,
                  onTap: navigationShell.goBranch,
                ),
              );
            },
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/',
                    builder: (_, __) => HomePage(
                      title: F.appFlavor?.name ?? '',
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/profile',
                    builder: (_, __) => const ProfilePage(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/settings',
                    builder: (_, __) => const SettingsPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
}
