import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_boilerplate/auth/presentation/cubits/auth_state.dart';
import 'package:flutter_boilerplate/shared/presentation/cubits/app_theme_cubit.dart';
import 'package:flutter_boilerplate/shared/presentation/widgets/molecules/locale_popup_menu.dart';
import 'package:flutter_boilerplate/shared/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    void changeTheme() {
      context.read<AppThemeCubit>().changeTheme();
    }

    void logout() {
      context.read<AuthCubit>().logout();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            LocalePopupMenu(),
            IconButton(
              onPressed: changeTheme,
              icon: BlocBuilder<AppThemeCubit, bool>(
                builder: (context, state) => Icon(
                  !state ? Icons.light_mode : Icons.dark_mode,
                ),
              ),
            ),
            IconButton(
              onPressed: logout,
              icon: BlocConsumer<AuthCubit, AuthState>(
                builder: (context, state) => Icon(
                  Icons.logout,
                ),
                listener: (
                  listenerContext,
                  state,
                ) {
                  if (state is AuthInitial) {
                    GoRouter.of(listenerContext).go('/'); // Naviga
                  }
                },
              ),
            ),
          ],
        ),
        body: ScreenLayout(
          children: [],
        ));
  }
}
