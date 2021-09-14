import 'package:diskursv2/api/repositories/language.enum.dart';
import 'package:flutter/material.dart';

class LanguagePickerWidget extends StatelessWidget {
  final Function(LanguageEnum) onLanguagePicked;

  const LanguagePickerWidget({
    Key? key,
    required this.onLanguagePicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.language),
      onSelected: onLanguagePicked,
      itemBuilder: (BuildContext context) {
        return const <PopupMenuEntry<LanguageEnum>>[
          PopupMenuItem(
            value: LanguageEnum.slovene,
            child: ListTile(
              leading: Text('🇸🇮', style: TextStyle(fontSize: 24.0)),
              title: Text(
                'Slovene',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          PopupMenuItem(
            value: LanguageEnum.slovene,
            child: ListTile(
              leading: Text('🇭🇷', style: TextStyle(fontSize: 24.0)),
              title: Text(
                'Croatian',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          PopupMenuItem(
            value: LanguageEnum.slovene,
            child: ListTile(
              leading: Text('🇷🇸', style: TextStyle(fontSize: 24.0)),
              title: Text(
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
