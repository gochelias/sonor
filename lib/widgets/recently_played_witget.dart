import 'package:flutter/cupertino.dart';
import 'package:sonor/widgets/card_playlist_widget.dart';

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145.0,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 16.0,
          mainAxisExtent: 120.0,
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
