import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sonor/greetings.dart';
import 'package:sonor/widgets/widgets.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        title: Text(
          greetings(),
          style: const TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              right: 16.0,
            ),
            child: const SonorIconButton(
              icon: 'assets/icons/setting_linear.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            TabsSection(),
            SizedBox(height: 32.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Recently Played',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            RecentAlbumsSection(),
          ],
        ),
      ),
    );
  }
}
