import 'package:diskursv2/api/repositories/language.enum.dart';
import 'package:diskursv2/utils/constants/color.const.dart';
import 'package:flutter/material.dart';

class LanguagePickerWidget extends StatelessWidget {
  final LanguageEnum currentLanguage;
  final Function(LanguageEnum) onLanguagePicked;

  const LanguagePickerWidget({
    Key? key,
    required this.currentLanguage,
    required this.onLanguagePicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.language),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<LanguageEnum>>[
          PopupMenuItem(
            padding: EdgeInsets.zero,
            value: LanguageEnum.slovene,
            onTap: () => onLanguagePicked(LanguageEnum.slovene),
            child: ListTile(
              tileColor: currentLanguage == LanguageEnum.slovene
                  ? colorBrandLight
                  : null,
              leading: const Text('🇸🇮', style: TextStyle(fontSize: 24.0)),
              title: const Text(
                'Slovene',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          PopupMenuItem(
            padding: EdgeInsets.zero,
            value: LanguageEnum.slovene,
            onTap: () => onLanguagePicked(LanguageEnum.croatian),
            child: ListTile(
              tileColor: currentLanguage == LanguageEnum.croatian
                  ? colorBrandLight
                  : null,
              leading: const Text('🇭🇷', style: TextStyle(fontSize: 24.0)),
              title: const Text(
                'Croatian',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          PopupMenuItem(
            padding: EdgeInsets.zero,
            value: LanguageEnum.slovene,
            onTap: () => onLanguagePicked(LanguageEnum.serbian),
            child: ListTile(
              tileColor: currentLanguage == LanguageEnum.serbian
                  ? colorBrandLight
                  : null,
              leading: const Text('🇷🇸', style: TextStyle(fontSize: 24.0)),
              title: const Text(
                'Serbian',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}
