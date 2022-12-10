import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sonor/widgets/album_widget.dart';
import 'package:sonor/widgets/recent_albums_section_widget.dart';
import 'package:sonor/widgets/tabs_section_widget.dart';

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
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            TabsSection(),
            SizedBox(height: 30.0),
            RecentAlbumsSection(),
          ],
        ),
      ),
    );
  }
}
