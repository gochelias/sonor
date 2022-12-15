import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sonor/widgets/widgets.dart';

class Songs {
  const Songs(
    this.image,
    this.songName,
    this.artistName,
  );

  final String image;
  final String songName;
  final String artistName;
}

class SongsScreen extends StatelessWidget {
  const SongsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final nameSongs = [
      'Song Name',
      'Song Name',
    ];

    final artists = [
      'artist name',
      'artist name',
    ];

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        toolbarHeight: 80.0,
        backgroundColor: Colors.black,
        title: const Text(
          'Songs',
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/search_outline.svg',
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: nameSongs.length,
        itemBuilder: (context, index) {
          return Song(
            name: nameSongs[index],
            artist: artists[index],
          );
        },
      ),
    );
  }
}
