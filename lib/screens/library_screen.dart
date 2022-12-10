import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:sonor/widgets/widgets.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        titleSpacing: 0.0,
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Home',
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w500),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Ionicons.settings_outline,
                size: 22.0,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 6.0),
        child: GridView.count(
          childAspectRatio: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: const <Widget>[
            TabIconHome(
              icon: 'assets/icons/music_bold.svg',
              label: 'Songs',
              path: '/songs',
            ),
            TabIconHome(
              icon: 'assets/icons/microphone_bold.svg',
              label: 'Artists',
              path: '/artists',
            ),
            TabIconHome(
              icon: 'assets/icons/heart_bold.svg',
              label: 'Favorites',
              path: '/favorites',
            ),
            TabIconHome(
              icon: 'assets/icons/music_albums_bold.svg',
              label: 'Albums',
              path: '/albums',
            ),
          ],
        ),
      ),
    );
  }
}
