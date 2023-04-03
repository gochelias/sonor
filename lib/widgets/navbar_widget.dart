import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Container(
      height: 72.0,
      padding: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CupertinoColors.black,
            CupertinoColors.black.withOpacity(0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: BottomNavigationBar(
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        currentIndex: selectedIndex,
        onTap: (int index) => onItemTapped(index, context),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: NavbarIcon(
              icon: SonorIcons.home_bold,
              color: CupertinoColors.label.darkColor,
            ),
            icon: const NavbarIcon(
              icon: SonorIcons.home_linear,
              color: CupertinoColors.systemGrey6,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: NavbarIcon(
              icon: SonorIcons.search_bold,
              color: CupertinoColors.label.darkColor,
            ),
            icon: const NavbarIcon(
              icon: SonorIcons.search_linear,
              color: CupertinoColors.systemGrey6,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            activeIcon: NavbarIcon(
              icon: SonorIcons.music_library_bold,
              color: CupertinoColors.label.darkColor,
            ),
            icon: const NavbarIcon(
              icon: SonorIcons.music_library_linear,
              color: CupertinoColors.systemGrey6,
            ),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
