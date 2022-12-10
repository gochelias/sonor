import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonor/widgets/tab_home_widget.dart';

class TabsSection extends StatelessWidget {
  const TabsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> tabs = [
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
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 110.0,
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          mainAxisExtent: 50.0,
        ),
        itemBuilder: (context, index) {
          return tabs[index];
        },
      ),
    );
  }
}
