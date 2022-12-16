import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:sonor/icons/icons.dart';
import 'package:sonor/widgets/widgets.dart';

class Player extends StatefulWidget {
  const Player({
    super.key,
    required this.song,
    required this.audioPlayer,
  });

  final SongModel song;
  final AudioPlayer audioPlayer;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    playSong();
  }

  void playSong() async {
    await widget.audioPlayer
        .setAudioSource(
          AudioSource.uri(
            Uri.parse(widget.song.uri!),
          ),
        )
        .catchError((onError) => print(onError));

    widget.audioPlayer.play();
  }

  void buttonPrevious() {}

  void buttonPlayOrPause() {
    setState(() {
      isPlaying = !isPlaying;

      if (isPlaying) {
        widget.audioPlayer.pause();
      } else {
        widget.audioPlayer.play();
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
                                widget.song.title,
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
                      const SizedBox(height: 4.0),
                      Text(
                        widget.song.artist ?? 'no artist',
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
          SliderTheme(
              data: SliderThemeData(
                trackHeight: 2.0,
                thumbColor: CupertinoColors.white,
                activeTrackColor: CupertinoColors.white,
                inactiveTrackColor: CupertinoColors.systemGrey3.darkColor,
                overlayColor: Colors.transparent,
              ),
              child: Slider(
                value: 20,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    value = value;
                  });
                },
              )),
          /* Container(
            width: 320.0,
            height: 2.0,
            alignment: Alignment.centerLeft,
            color: CupertinoColors.systemGrey3.darkColor,
            child: Container(
              width: 100.0,
              color: CupertinoColors.white,
            ),
          ), */
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
                  Duration(seconds: widget.song.duration!).inMinutes.toString(),
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
              children: <Widget>[
                SonorIconButton(
                  onTap: () => buttonPrevious(),
                  icon: SonorIcons.previous_bold,
                  color: CupertinoColors.white,
                  size: 40.0,
                ),
                SonorIconButton(
                  onTap: () => buttonPlayOrPause(),
                  icon:
                      isPlaying ? SonorIcons.play_bold : SonorIcons.pause_bold,
                  color: CupertinoColors.white,
                  size: 40.0,
                ),
                SonorIconButton(
                  onTap: () => buttonNext(),
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
