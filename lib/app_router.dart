// lib/app_router.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/flavors.dart';
import 'package:flutter_boilerplate/sample_feature/presentation/cubits/auth_cubit.dart';
import 'package:flutter_boilerplate/sample_feature/presentation/cubits/auth_state.dart';
import 'package:flutter_boilerplate/sample_feature/presentation/pages/login_page.dart';
import 'package:flutter_boilerplate/sample_feature/presentation/pages/register_page.dart';
import 'package:flutter_boilerplate/shared/di/injection.dart';
import 'package:flutter_boilerplate/shared/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
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
      // Define your app routes here
      GoRoute(
        path: '/',
        builder: (context, state) => MyHomePage(
          title: F.appFlavor?.name ?? '',
        ),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => RegisterPage(),
      ),
    ],
  );
}
