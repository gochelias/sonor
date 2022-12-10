import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SonorBottomNavbar extends StatelessWidget {
  const SonorBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      color: const Color(0xff0f0f0f),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              context.go('/');
            },
            child: const SonorBottomNavbarItem(
              path: '/',
              label: 'Home',
              icon: 'assets/icons/home_bold.svg',
            ),
          ),
          GestureDetector(
            onTap: () {
              context.go('/playlist');
            },
            child: const SonorBottomNavbarItem(
              path: '/playlist',
              label: 'Playlist',
              icon: 'assets/icons/music_list_bold.svg',
            ),
          ),
          GestureDetector(
            onTap: () {
              context.go('/explore');
            },
            child: const SonorBottomNavbarItem(
              path: '/explore',
              label: 'Explore',
              icon: 'assets/icons/search_outline.svg',
            ),
          ),
        ],
      ),
    );
  }
}

class SonorBottomNavbarItem extends StatelessWidget {
  const SonorBottomNavbarItem({
    super.key,
    required this.path,
    required this.icon,
    required this.label,
  });

  final String path;
  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    bool selected = false;
    final String location = GoRouterState.of(context).location;
    if (location == path) selected = true;

    return Container(
      width: 65.0,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 22.0,
            height: 22.0,
            child: SvgPicture.asset(
              icon,
              color:
                  selected ? const Color(0xFFff385f) : const Color(0xFF626266),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 13.0,
              color:
                  selected ? const Color(0xFFff385f) : const Color(0xFF626266),
            ),
          )
        ],
      ),
    );
  }
}
