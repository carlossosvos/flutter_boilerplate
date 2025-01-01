import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_boilerplate/auth/presentation/cubits/auth_state.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/shared/presentation/cubits/app_theme_cubit.dart';
import 'package:flutter_boilerplate/shared/presentation/widgets/molecules/locale_popup_menu.dart';
import 'package:flutter_boilerplate/shared/presentation/widgets/organisms/custom_alert_dialog.dart';
import 'package:flutter_boilerplate/shared/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  void _showCustomAlertDialog(BuildContext context) {
    //String localization
    final strings = S.of(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          //Sending example title
          title: strings.example_dialog_title,
          message: strings.example_dialog_message,
          onConfirm: () {
            Navigator.of(context).pop();
            // Handle confirm action
          },
          onCancel: () {
            Navigator.of(context).pop();
            // Handle cancel action
          },
        );
      },
    );
  }

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
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () => _showCustomAlertDialog(context),
                  child: Text(S.of(context).show_dialog),
                ),
              ],
            ),
          ],
        ));
  }
}
