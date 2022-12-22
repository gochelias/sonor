import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'package:sonor/widgets/widgets.dart';
import 'package:sonor/config/routes/routes.dart';
import 'package:sonor/widgets/song/song_currently_playing.dart';

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

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
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
  '/playlist',
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
    const String musicPlaylistSvg = 'assets/icons/music_playlist_bold.svg';
    const String searchOutlineSvg = 'assets/icons/search_outline.svg';
    const String homeBoldSvg = 'assets/icons/home_bold.svg';

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
                child: SongCurrentlyPlaying(
                  image:
                      'https://i1.sndcdn.com/artworks-IBwHyCww2eKRuJM8-lBp1Ug-t200x200.jpg',
                  songName: 'Vega',
                  artistName: 'LXST CXTURY',
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff0f0f0f),
        selectedItemColor: const Color(0xFFff385f),
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
        unselectedItemColor: const Color(0xFF626266),
        currentIndex: _selectedIndex,
        onTap: (int index) => _onItemTapped(index, context),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: NavbarItemIcon(
              icon: homeBoldSvg,
              selected: _selectedIndex == 0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: NavbarItemIcon(
              icon: searchOutlineSvg,
              selected: _selectedIndex == 1,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: NavbarItemIcon(
              icon: musicPlaylistSvg,
              selected: _selectedIndex == 2,
            ),
            label: 'Playlis',
          ),
        ],
      ),
    );
  }
}
