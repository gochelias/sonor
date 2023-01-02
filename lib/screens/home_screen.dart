import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:sonor/greetings.dart';
import 'package:sonor/icons/icons.dart';
import 'package:sonor/widgets/widgets.dart';
import 'package:sonor/config/themes/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        elevation: 0.0,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              greetings(),
              style: TextStyle(
                color: SonorTheme(context).dynamicColor(
                  color: CupertinoColors.label,
                  darkColor: CupertinoColors.label.darkColor,
                ),
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Let\'s play some music!',
              style: TextStyle(
                color: SonorTheme(context).dynamicColor(
                  color: CupertinoColors.secondaryLabel,
                  darkColor: CupertinoColors.secondaryLabel.darkColor,
                ),
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          SonorIconButton(
            onTap: () => context.goNamed('settings'),
            icon: SonorIcons.settings_linear,
            size: 24.0,
            color: Colors.white,
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 6.0, bottom: 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            ViewAllSeparator(
              label: 'Recently played',
              routeName: 'playlist',
              marginTop: 16.0,
            ),
            RecentlyPlayed(),
          ],
        ),
      ),
    );
  }
}
