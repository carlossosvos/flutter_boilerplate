import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/shared/presentation/cubits/locale_cubit.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({
    super.key,
    required this.currentLocale,
    required this.onChanged,
  });

  final Locale currentLocale;
  final ValueChanged<Locale> onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, state) {
        return PopupMenuButton<Locale>(
          initialValue: currentLocale,
          onSelected: onChanged,
          itemBuilder: (context) => S.delegate.supportedLocales.map((locale) {
            return PopupMenuItem<Locale>(
              value: locale,
              child: Stack(
                children: [
                  Text(
                    locale.languageCode.toUpperCase(),
                    style: TextStyle(
                      fontWeight:
                          locale == state ? FontWeight.w900 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(currentLocale.languageCode.toUpperCase()),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        );
      },
    );
  }
}
