import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/shared/presentation/cubits/app_theme_cubit.dart';
import 'package:flutter_boilerplate/shared/presentation/cubits/locale_cubit.dart';
import 'package:flutter_boilerplate/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_boilerplate/shared/presentation/widgets/widgets.dart';
import 'package:flutter_boilerplate/shared/presentation/widgets/atoms/theme_toggle.dart';
import 'package:flutter_boilerplate/shared/presentation/widgets/atoms/language_dropdown.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.settings),
      ),
      body: ScreenLayout(
        children: [
          Expanded(
            child: ListView(
              primary: false,
              children: [
                ListTile(
                  title: Text(S.current.dark_mode),
                  trailing: BlocBuilder<AppThemeCubit, bool>(
                    builder: (BuildContext context, bool state) {
                      return ThemeToggle(
                        isDarkMode: !state,
                        onToggle: (value) =>
                            context.read<AppThemeCubit>().changeTheme(),
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text(S.current.language),
                  trailing: BlocBuilder<LocaleCubit, Locale>(
                    builder: (context, locale) {
                      return LanguageDropdown(
                        currentLocale: locale,
                        onChanged: (newLocale) =>
                            context.read<LocaleCubit>().setLocale(newLocale),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.read<AuthCubit>().logout(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: Text(S.current.log_out),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
