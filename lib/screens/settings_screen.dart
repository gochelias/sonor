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

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          bottom: 80.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Theme',
            ),
            DropdownButton<String>(
              borderRadius: BorderRadius.circular(10.0),
              value: appPreferencesWatch.themeMode,
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
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
      ),
    );
  }
}
