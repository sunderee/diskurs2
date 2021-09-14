import 'package:flutter/material.dart';

class MenuPickerWidget extends StatelessWidget {
  static const int settingsID = 0;
  static const int sourceCodeID = 1;

  final Function(int) onMenuItemClickListener;

  const MenuPickerWidget({
    Key? key,
    required this.onMenuItemClickListener,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      onSelected: onMenuItemClickListener,
      itemBuilder: (BuildContext context) {
        return const <PopupMenuEntry<int>>[
          PopupMenuItem(
            value: settingsID,
            child: ListTile(
              title: Text('Settings'),
            ),
          ),
          PopupMenuItem(
            value: sourceCodeID,
            child: ListTile(
              title: Text('Source code'),
            ),
          ),
        ];
      },
    );
  }
}
