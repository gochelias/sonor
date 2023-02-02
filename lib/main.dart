import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:sonor/providers/providers.dart';
import 'package:sonor/config/routes/routes.dart';
import 'package:sonor/config/themes/themes.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<AppPreferencesProvider>(
          create: (_) => AppPreferencesProvider()..initialize(),
        ),
        ChangeNotifierProvider<SongPlayingProvider>(
          create: (_) => SongPlayingProvider(),
        ),
        ChangeNotifierProvider<SongPlayerProvider>(
          create: (_) => SongPlayerProvider(),
        ),
      ],
      child: const Sonor(),
    );
  }
}

class Sonor extends StatelessWidget {
  const Sonor({super.key});

  @override
  Widget build(BuildContext context) {
    AppPreferencesProvider appPreferencesWatch =
        context.watch<AppPreferencesProvider>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: appPreferencesWatch.getThemeMode(),
      theme: lightTheme(),
      darkTheme: darkTheme(),
      routerConfig: router(),
    );
  }
}
