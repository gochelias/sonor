import 'package:flutter/material.dart';

class Album extends StatelessWidget {
  const Album({
    super.key,
    required this.name,
    required this.artists,
    /* required this.path, */
  });

  final String name;
  final String artists;
  /* final String path; */

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 140.0,
            height: 140.0,
            margin: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              color: const Color(0xFF1c1c1e),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
          Text(
            artists,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              color: Color(0xFF626266),
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
