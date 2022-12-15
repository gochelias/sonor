import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sonor/icons/icons.dart';
import 'package:sonor/widgets/widgets.dart';

class Player extends StatelessWidget {
  const Player({
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
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Color(0xff0f0f0f),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 320.0,
            height: 320.0,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6.darkColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 56.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 290.0,
                              child: Text(
                                name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            const SonorIconButton(
                              icon: SonorIcons.heart_linear,
                              color: CupertinoColors.white,
                              size: 22.0,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        artist,
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2.darkColor,
                          fontSize: 12.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32.0),
          Container(
            width: 320.0,
            height: 2.0,
            alignment: Alignment.centerLeft,
            color: CupertinoColors.systemGrey3.darkColor,
            child: Container(
              width: 100.0,
              color: CupertinoColors.white,
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '1:30',
                  style: TextStyle(
                    color: CupertinoColors.systemGrey3.darkColor,
                    fontSize: 10.0,
                  ),
                ),
                Text(
                  '3:30',
                  style: TextStyle(
                    color: CupertinoColors.systemGrey3.darkColor,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60.0,
            margin: const EdgeInsets.symmetric(vertical: 48.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                SonorIconButton(
                  icon: SonorIcons.previous_bold,
                  color: CupertinoColors.white,
                  size: 40.0,
                ),
                SonorIconButton(
                  icon: SonorIcons.pause_linear,
                  color: CupertinoColors.white,
                  size: 40.0,
                ),
                SonorIconButton(
                  icon: SonorIcons.next_bold,
                  color: CupertinoColors.white,
                  size: 40.0,
                ),
              ],
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SonorIconButton(
                  icon: SonorIcons.repeate_linear,
                  color: CupertinoColors.systemGrey.darkColor,
                  size: 22.0,
                ),
                SonorIconButton(
                  icon: SonorIcons.quote_square_linear,
                  color: CupertinoColors.systemGrey.darkColor,
                  size: 22.0,
                ),
                SonorIconButton(
                  icon: SonorIcons.more_bold,
                  color: CupertinoColors.systemGrey.darkColor,
                  size: 22.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
