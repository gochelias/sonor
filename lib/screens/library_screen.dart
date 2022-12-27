import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sonor/screens/screens.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CupertinoColors.systemBackground.darkColor,
          title: Text(
            'Library',
            style: TextStyle(
              color: CupertinoColors.label.darkColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                unselectedLabelColor: CupertinoColors.secondaryLabel.darkColor,
                physics: const BouncingScrollPhysics(),
                labelColor: CupertinoColors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: CupertinoColors.systemPink.darkColor,
                splashFactory: NoSplash.splashFactory,
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                labelPadding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  bottom: 12.0,
                ),
                tabs: const <Widget>[
                  Text('Playlists'),
                  Text('Songs'),
                  Text('Artists'),
                  Text('Albums'),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            PlaylistScreen(),
            Center(
              child: Text(
                'Songs',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                'Artists',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                'Albums',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
