import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:sonor/providers/providers.dart';
import 'package:sonor/config/routes/routes.dart';
import 'package:sonor/config/themes/themes.dart';
import 'package:sonor/widgets/widgets.dart';
import 'package:sonor/icons/icons.dart';

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
          create: (context) => SongPlayingProvider(),
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

class SonorStatefullWidget extends StatefulWidget {
  const SonorStatefullWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<SonorStatefullWidget> createState() => _SonorStatefullWidgetState();
}

const routes = [
  '/',
  '/explore',
  '/library',
];

class _SonorStatefullWidgetState extends State<SonorStatefullWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
    });
    context.go(routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            Center(
              child: SizedBox(
                child: widget.child,
              ),
            ),
            const Positioned(
              bottom: 0.0,
              child: CurrentlyPlaying(
                name: 'Song Name',
                artist: 'Artist Name',
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: CupertinoColors.systemBackground.darkColor,
        currentIndex: _selectedIndex,
        onTap: (int index) => _onItemTapped(index, context),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              SonorIcons.home_bold,
              color: CupertinoColors.white,
            ),
            icon: SvgPicture.asset(
              SonorIcons.home_linear,
              color: CupertinoColors.secondaryLabel.darkColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              SonorIcons.search_bold,
              color: CupertinoColors.white,
            ),
            icon: SvgPicture.asset(
              SonorIcons.search_linear,
              color: CupertinoColors.secondaryLabel.darkColor,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              SonorIcons.music_library_bold,
              color: CupertinoColors.white,
            ),
            icon: SvgPicture.asset(
              SonorIcons.music_library_linear,
              color: CupertinoColors.secondaryLabel.darkColor,
            ),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
