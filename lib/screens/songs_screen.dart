import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sonor/widgets/widgets.dart';

class SongsScreen extends StatelessWidget {
  const SongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: const <Widget>[
          Song(
            image:
                'https://2.bp.blogspot.com/-UvkRRxoqHaQ/WIY-0hNw4UI/AAAAAAAADSI/GSuKOllaI3M6XPKnDWgBFRWks-jbWOg7ACLcB/s100/C23xoliVQAA2eng.jpg',
            songName: 'Scared to be lonley',
            artistName: 'Martin Garrix',
          ),
          /* Divider(color: Color(0xff444444)), */
          Song(
            image:
                'https://is3-ssl.mzstatic.com/image/thumb/Music125/v4/1b/64/14/1b64140b-fde9-6159-e0b9-dbcc0ed73a8b/artwork.jpg/100x100bf-60.jpg',
            songName: 'Leave Your Side',
            artistName: 'Shxpe',
          ),
          Song(
            image:
                'https://is3-ssl.mzstatic.com/image/thumb/Music125/v4/1b/64/14/1b64140b-fde9-6159-e0b9-dbcc0ed73a8b/artwork.jpg/100x100bf-60.jpg',
            songName: 'Leave Your Side',
            artistName: 'Shxpe',
          ),
          Song(
            image:
                'https://is3-ssl.mzstatic.com/image/thumb/Music125/v4/1b/64/14/1b64140b-fde9-6159-e0b9-dbcc0ed73a8b/artwork.jpg/100x100bf-60.jpg',
            songName: 'Leave Your Side',
            artistName: 'Shxpe',
          ),
          Song(
            image:
                'https://is3-ssl.mzstatic.com/image/thumb/Music125/v4/1b/64/14/1b64140b-fde9-6159-e0b9-dbcc0ed73a8b/artwork.jpg/100x100bf-60.jpg',
            songName: 'Leave Your Side',
            artistName: 'Shxpe',
          ),
          Song(
            image:
                'https://is3-ssl.mzstatic.com/image/thumb/Music125/v4/1b/64/14/1b64140b-fde9-6159-e0b9-dbcc0ed73a8b/artwork.jpg/100x100bf-60.jpg',
            songName: 'Leave Your Side',
            artistName: 'Shxpe',
          ),
          Song(
            image:
                'https://is3-ssl.mzstatic.com/image/thumb/Music125/v4/1b/64/14/1b64140b-fde9-6159-e0b9-dbcc0ed73a8b/artwork.jpg/100x100bf-60.jpg',
            songName: 'Leave Your Side',
            artistName: 'Shxpe',
          ),
          Song(
            image:
                'https://is3-ssl.mzstatic.com/image/thumb/Music125/v4/1b/64/14/1b64140b-fde9-6159-e0b9-dbcc0ed73a8b/artwork.jpg/100x100bf-60.jpg',
            songName: 'Leave Your Side',
            artistName: 'Shxpe',
          ),
          Song(
            image:
                'https://is3-ssl.mzstatic.com/image/thumb/Music125/v4/1b/64/14/1b64140b-fde9-6159-e0b9-dbcc0ed73a8b/artwork.jpg/100x100bf-60.jpg',
            songName: 'Leave Your Side',
            artistName: 'Shxpe',
          ),
          Song(
            image:
                'https://is3-ssl.mzstatic.com/image/thumb/Music125/v4/1b/64/14/1b64140b-fde9-6159-e0b9-dbcc0ed73a8b/artwork.jpg/100x100bf-60.jpg',
            songName: 'Leave Your Side',
            artistName: 'Shxpe',
          ),
          Song(
            image:
                'https://is3-ssl.mzstatic.com/image/thumb/Music125/v4/1b/64/14/1b64140b-fde9-6159-e0b9-dbcc0ed73a8b/artwork.jpg/100x100bf-60.jpg',
            songName: 'Leave Your Side',
            artistName: 'Shxpe',
          ),
          Song(
            image:
                'https://is3-ssl.mzstatic.com/image/thumb/Music125/v4/1b/64/14/1b64140b-fde9-6159-e0b9-dbcc0ed73a8b/artwork.jpg/100x100bf-60.jpg',
            songName: 'Leave Your Side',
            artistName: 'Shxpe',
          ),
        ],
      ),
    );
  }
}
