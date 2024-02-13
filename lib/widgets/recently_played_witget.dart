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
      height: 144.0,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          mainAxisExtent: 144.0,
          childAspectRatio: 280.0,
        ),
        itemCount: 3,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (context, index) {
          return const CardPlaylist(
            name: 'Playlist Name',
            size: 100.0,
            fontSize: 12.0,
          );
        },
      ),
    );
  }
}
