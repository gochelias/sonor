import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:sonor/icons/icons.dart';
import 'package:sonor/widgets/widgets.dart';
import 'package:sonor/widgets/player/player_slider_widget.dart';

class Player extends StatefulWidget {
  const Player({
    super.key,
    required this.song,
    required this.player,
  });

  final SongModel song;
  final AudioPlayer player;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    startSong();
  }

  void startSong() async {
    await widget.player
        .setAudioSource(
          AudioSource.uri(
            Uri.parse(widget.song.uri!),
          ),
        )
        .catchError((onError) => print(onError));

    widget.player.play();
  }

  void buttonPrevious() {}

  void buttonPlayOrPause() {
    setState(() {
      isPlaying = !isPlaying;

      if (isPlaying) {
        widget.player.pause();
      } else {
        widget.player.play();
      }
    });
  }

  void buttonNext() {}

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
            child: Artwork(
              id: widget.song.id,
              type: ArtworkType.AUDIO,
              size: 400,
              quality: 400,
              iconSize: 64.0,
              borderRadius: 12.0,
              containerSize: 320.0,
            ),
          ),
          const SizedBox(height: 20.0),
          SonorSlider(player: widget.player),
          Container(
            margin: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: <Widget>[
                Text(
                  widget.song.title,
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
                  widget.song.artist ?? 'no artist',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SonorIconButton(
                  icon: SonorIcons.heart_bold,
                  color: CupertinoColors.systemPink.darkColor,
                ),
                SonorIconButton(
                  onTap: () => buttonPrevious(),
                  icon: SonorIcons.previous_bold,
                  color: CupertinoColors.white,
                  size: 36.0,
                ),
                SonorIconButton(
                  onTap: () => buttonPlayOrPause(),
                  icon:
                      isPlaying ? SonorIcons.play_bold : SonorIcons.pause_bold,
                  color: CupertinoColors.white,
                  size: 44.0,
                ),
                SonorIconButton(
                  onTap: () => buttonNext(),
                  icon: SonorIcons.next_bold,
                  color: CupertinoColors.white,
                  size: 36.0,
                ),
                SonorIconButton(
                  icon: SonorIcons.repeate_one_linear,
                  color: CupertinoColors.systemGrey.darkColor,
                ),
              ],
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SonorIconButton(
                  icon: SonorIcons.download_linear,
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
