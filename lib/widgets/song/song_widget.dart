import 'package:flutter/material.dart';

class Song extends StatelessWidget {
  const Song({
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
    return SizedBox(
      /* color: Colors.blueGrey, */
      child: Row(
        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6.0),
                image: DecorationImage(
                  image: NetworkImage(image),
                )),
          ),
          const SizedBox(width: 10.0),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(vertical: 11.0),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xFF1c1c1e)))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  songName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  artistName,
                  style: const TextStyle(
                    color: Color(0xFF626266),
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
