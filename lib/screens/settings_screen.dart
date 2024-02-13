import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sonor/providers/providers.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppPreferencesProvider appPreferencesWatch =
        context.watch<AppPreferencesProvider>();

    AppPreferencesProvider appPreferencesRead =
        context.read<AppPreferencesProvider>();

    const List<String> list = <String>['Auto', 'Light', 'Dark'];

    return Container(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
        bottom: 80.0,
      ),
      decoration: const BoxDecoration(
        color: CupertinoColors.darkBackgroundGray,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Settings',
            style: TextStyle(
              color: CupertinoColors.label.darkColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey5.darkColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Theme',
                      style: TextStyle(
                        color: CupertinoColors.label.darkColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    DropdownButton<String>(
                      isDense: true,
                      underline: const SizedBox(),
                      value: appPreferencesWatch.themeMode,
                      borderRadius: BorderRadius.circular(12.0),
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          alignment: Alignment.center,
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) async {
                        await appPreferencesRead.setThemeMode(value ?? 'Auto');
                      },
                    ),
                  ],
                ),
                Divider(
                  color: CupertinoColors.separator.darkColor,
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Language',
                      style: TextStyle(
                        color: CupertinoColors.label.darkColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
