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
      width: 360.0,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      /* margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0), */
      decoration: const BoxDecoration(
        color: Color(0xff0f0f0f),
        border: Border(
          bottom: BorderSide(width: 1, color: Color(0xFF1c1c1e)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 35.0,
            height: 35.0,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                image: DecorationImage(
                  image: NetworkImage(image),
                )),
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
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  artistName,
                  style: const TextStyle(
                    color: Color(0xFF626266),
                    fontSize: 9.0,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
