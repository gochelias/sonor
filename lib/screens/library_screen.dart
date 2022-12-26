import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sonor/greetings.dart';
import 'package:sonor/icons/icons.dart';
import 'package:sonor/widgets/recently_played_witget.dart';
import 'package:sonor/widgets/view_all_separator_widget.dart';
import 'package:sonor/widgets/widgets.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 6.0, bottom: 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100.0,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        greetings(),
                        style: TextStyle(
                            color: CupertinoColors.label.darkColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Let\'s play some music!',
                        style: TextStyle(
                          color: CupertinoColors.secondaryLabel.darkColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const <Widget>[
                      SonorIconButton(
                        icon: SonorIcons.search_linear,
                        size: 24.0,
                        color: Colors.white,
                      ),
                      SizedBox(width: 16.0),
                      SonorIconButton(
                        icon: SonorIcons.settings_linear,
                        size: 24.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const ViewAllSeparator(
              label: 'Recently played',
              routeName: 'playlist',
            ),
            const RecentlyPlayed(),
          ],
        ),
      ),
    );
  }
}
