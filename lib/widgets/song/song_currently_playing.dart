import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongCurrentlyPlaying extends StatelessWidget {
  const SongCurrentlyPlaying({
    super.key,
    required this.image,
    required this.songName,
    required this.artistName,
  });

  final String image;
  final String songName;
  final String artistName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: CupertinoColors.darkBackgroundGray,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                image: DecorationImage(
                  image: NetworkImage(image),
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    songName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    artistName,
                    style: TextStyle(
                      color: CupertinoColors.white.withOpacity(0.6),
                      fontSize: 9.0,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
