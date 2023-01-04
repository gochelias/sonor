import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

import 'package:sonor/icons/icons.dart';
import 'package:sonor/providers/providers.dart';
import 'package:sonor/widgets/widgets.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SongPlayingProvider songPlayingWatch = context.watch<SongPlayingProvider>();
    SongPlayingProvider songPlayingRead = context.read<SongPlayingProvider>();

    void buttonPrevious() {}
    void buttonNext() {}

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
            child: Artwork(
              id: songPlayingWatch.songPlaying.id,
              type: ArtworkType.AUDIO,
              size: 400,
              quality: 400,
              iconSize: 64.0,
              borderRadius: 12.0,
              containerSize: 320.0,
            ),
          ),
          const SizedBox(height: 20.0),
          /* SonorSlider(player: widget.player), */
          Container(
            margin: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: <Widget>[
                Text(
                  songPlayingWatch.songPlaying.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 4.0),
                Text(
                  songPlayingWatch.songPlaying.artist,
                  style: TextStyle(
                    color: CupertinoColors.systemGrey.darkColor,
                    fontSize: 12.0,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          Container(
            height: 60.0,
            margin: const EdgeInsets.only(bottom: 52.0, top: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SonorIconButton(
                  onTap: () => buttonPrevious(),
                  icon: SonorIcons.previous_bold,
                  color: CupertinoColors.white,
                  size: 36.0,
                ),
                SonorIconButton(
                  onTap: () {
                    songPlayingRead.setState(!songPlayingWatch.isPlaying);
                  },
                  icon: songPlayingWatch.isPlaying
                      ? SonorIcons.pause_bold
                      : SonorIcons.play_bold,
                  color: CupertinoColors.white,
                  size: 44.0,
                ),
                SonorIconButton(
                  onTap: () => buttonNext(),
                  icon: SonorIcons.next_bold,
                  color: CupertinoColors.white,
                  size: 36.0,
                ),
              ],
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SonorIconButton(
                  icon: SonorIcons.repeate_linear,
                  color: CupertinoColors.systemGrey.darkColor,
                ),
                SonorIconButton(
                  icon: SonorIcons.quote_square_linear,
                  color: CupertinoColors.systemGrey.darkColor,
                ),
                SonorIconButton(
                  icon: SonorIcons.more_bold,
                  color: CupertinoColors.systemGrey.darkColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}