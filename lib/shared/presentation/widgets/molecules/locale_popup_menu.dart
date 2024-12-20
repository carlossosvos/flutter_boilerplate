// filepath: /Users/cgcasco/development/mystufff/flutter_boilerplate/lib/shared/presentation/widgets/molecules/locale_dropdown.dart
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/shared/presentation/widgets/molecules/icon_popup_menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/shared/presentation/cubits/locale_cubit.dart';

class LocalePopupMenu extends StatelessWidget {
  const LocalePopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (currentContext, currentState) => IconPopupMenu<Locale>(
          items: S.delegate.supportedLocales.map((locale) {
            return PopupMenuItem<Locale>(
              value: locale,
              child: Stack(
                children: [
                  Text(
                    locale.languageCode,
                    style: TextStyle(
                      fontWeight: locale == currentState
                          ? FontWeight.w900
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onSelected: (locale) {
            if (locale != null) {
              context.read<LocaleCubit>().setLocale(locale);
            }
          },
          icon: Icons.language_outlined,
          tooltip: S.of(context).settings_language),
    );
  }
}
