import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:sonor/icons/icons.dart';
import 'package:sonor/widgets/widgets.dart';

class SonorBottomNavbar extends StatefulWidget {
  const SonorBottomNavbar({super.key});

  @override
  State<SonorBottomNavbar> createState() => _SonorBottomNavbarState();
}

class _SonorBottomNavbarState extends State<SonorBottomNavbar> {
  int selectedIndex = 0;

  void onItemTapped(int index, BuildContext context) {
    const List<String> routes = <String>[
      '/',
      '/explore',
      '/library',
    ];

    setState(() {
      selectedIndex = index;
    });
    context.go(routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          const CurrentlyPlaying(),
          const SizedBox(height: 8.0),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: selectedIndex,
                onTap: (int index) => onItemTapped(index, context),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      SonorIcons.home_bold,
                      color: CupertinoColors.systemPink.darkColor,
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
                      color: CupertinoColors.systemPink.darkColor,
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
                      color: CupertinoColors.systemPink.darkColor,
                    ),
                    icon: SvgPicture.asset(
                      SonorIcons.music_library_linear,
                      color: CupertinoColors.secondaryLabel.darkColor,
                    ),
                    label: 'Library',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
