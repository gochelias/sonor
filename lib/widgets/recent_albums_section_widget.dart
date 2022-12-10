import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonor/widgets/album_widget.dart';

class RecentAlbumsSection extends StatelessWidget {
  const RecentAlbumsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Albums'.toUpperCase(),
                  style: const TextStyle(
                    color: Color(0xFFff385f),
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                const Text(
                  'Recently Played',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 190.0,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 14.0,
                mainAxisExtent: 140,
              ),
              itemBuilder: (context, index) {
                return const Album(
                  name: 'name',
                  artists: 'artist',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
