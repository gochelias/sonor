import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sonor/providers/song_playing_provider.dart';

import 'package:sonor/widgets/widgets.dart';
import 'package:sonor/icons/icons.dart';
import 'package:sonor/config/routes/routes.dart';

void main() => runApp(const Sonor());

class Sonor extends StatelessWidget {
  const Sonor({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF000000),
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<SongPlayingProvider>(
          create: (context) => SongPlayingProvider(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router(),
      ),
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
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: <Widget>[
              Center(
                child: SizedBox(
                  /* width: 320.0, */
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
