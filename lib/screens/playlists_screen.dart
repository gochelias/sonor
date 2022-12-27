import 'package:flutter/cupertino.dart';

import 'package:sonor/widgets/widgets.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          mainAxisExtent: 210,
        ),
        itemCount: 12,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          bottom: 80.0,
        ),
        itemBuilder: (context, index) {
          return const CardPlaylist(
            name: 'Playlist Name',
            size: 156.0,
            fontSize: 14.0,
            max: true,
            total: 18,
          );
        },
      ),
    );
  }
}
