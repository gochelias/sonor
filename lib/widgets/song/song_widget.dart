import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:sonor/icons/icons.dart';

import 'package:sonor/widgets/widgets.dart';

class Song extends StatelessWidget {
  const Song({
    super.key,
    required this.song,
    required this.audioPlayer,
  });

  final SongModel song;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    /* playSong() async {
      try {
        audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(path)));
        audioPlayer.play();
      } on Exception {
        print('->> Error!!!');
      }
    } */

    void playerScreen(BuildContext context) {
      showModalBottomSheet(
        useRootNavigator: true,
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return DraggableScrollableSheet(
            initialChildSize: 1,
            builder: (context, scrollController) {
              return MediaQuery(
                data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
                child: SafeArea(
                  child: Player(
                    song: song,
                    player: audioPlayer,
                  ),
                ),
              );
            },
          );
        },
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => playerScreen(context),
      child: Container(
        margin: const EdgeInsets.only(
          left: 16.0,
          right: 8.0,
          top: 8.0,
          bottom: 8.0,
        ),
        child: Row(
          children: <Widget>[
            Artwork(
              id: song.id,
              type: ArtworkType.AUDIO,
              borderRadius: 4.0,
              containerSize: 50.0,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      song.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        /* fontWeight: FontWeight.w500, */
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      song.artist ?? 'no artist',
                      style: TextStyle(
                        color: CupertinoColors.systemGrey.darkColor,
                        fontSize: 12.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )
                  ],
                ),
              ),
            ),
            SonorIconButton(
              icon: SonorIcons.more_bold,
              color: CupertinoColors.systemGrey.darkColor,
            )
          ],
        ),
      ),
    );
  }
}
