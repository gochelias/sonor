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
            preferredSize: const Size.fromHeight(40.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.transparent,
                ),
                splashFactory: NoSplash.splashFactory,
                physics: const BouncingScrollPhysics(),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                labelColor: CupertinoColors.label.darkColor,
                labelStyle: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelColor: CupertinoColors.systemGrey2.darkColor,
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                labelPadding: const EdgeInsets.only(
                  left: 8.0,
                  right: 18.0,
                  top: 6.0,
                  bottom: 6.0,
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
