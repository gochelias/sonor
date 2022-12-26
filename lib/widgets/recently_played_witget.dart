import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sonor/widgets/widgets.dart';

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94.0,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 16.0,
          mainAxisExtent: 124.0,
        ),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (context, index) {
          return const CardPlaylist(name: 'Playlist Name');
        },
      ),
    );
  }
}
