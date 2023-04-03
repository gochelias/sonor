import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sonor/icons/icons.dart';
import 'package:sonor/screens/screens.dart';
import 'package:sonor/widgets/icon_button_widget.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.0,
          title: Text(
            'Your Library',
            style: TextStyle(
              color: CupertinoColors.label.darkColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: const <Widget>[
            SonorIconButton(
              icon: SonorIcons.search_linear,
              color: CupertinoColors.white,
            ),
            SizedBox(width: 16.0),
            SonorIconButton(
              icon: SonorIcons.menu_bold,
              color: CupertinoColors.white,
            ),
            SizedBox(width: 8.0),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(32.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.transparent,
                ),
                splashFactory: NoSplash.splashFactory,
                physics: const BouncingScrollPhysics(),
                labelColor: CupertinoColors.label.darkColor,
                labelStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                indicatorColor: CupertinoColors.white,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: CupertinoColors.systemGrey2.darkColor,
                labelPadding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 6.0,
                  bottom: 8.0,
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
            SongsScreen(),
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
