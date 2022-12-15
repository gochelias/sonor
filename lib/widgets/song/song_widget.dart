import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sonor/widgets/widgets.dart';

class Song extends StatelessWidget {
  const Song({
    super.key,
    /* required this.id, */
    required this.name,
    required this.artist,
  });

  /* final int id; */
  final String name;
  final String artist;

  @override
  Widget build(BuildContext context) {
    void player(BuildContext context) {
      showModalBottomSheet(
        useRootNavigator: true,
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return DraggableScrollableSheet(
            initialChildSize: 0.95,
            builder: (context, scrollController) {
              return const Player(
                name: 'Song Name',
                artist: 'Artist Name',
              );
            },
          );
        },
      );
    }

    return GestureDetector(
      onTap: () => player(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6.darkColor,
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      artist,
                      style: const TextStyle(
                        color: Color(0xFF626266),
                        fontSize: 12.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
