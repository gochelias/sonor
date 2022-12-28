import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

import 'package:sonor/widgets/widgets.dart';
import 'package:sonor/icons/icons.dart';
import 'package:sonor/providers/providers.dart';

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
    SongPlaying songPlaying = SongPlaying(
      song.id,
      song.uri!,
      song.title,
      song.artist ?? 'No artist',
    );

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
      onTap: () => {
        playerScreen(context),
        context.read<SongPlayingProvider>().setSong(songPlaying, audioPlayer),
      },
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Artwork(
                  id: song.id,
                  type: ArtworkType.AUDIO,
                  borderRadius: 6.0,
                  containerSize: 48.0,
                ),
                const SizedBox(width: 12.0),
                SizedBox(
                  width: 224.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        song.title,
                        style: TextStyle(
                          color: CupertinoColors.label.darkColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        song.artist ?? 'no artist',
                        style: TextStyle(
                          color: CupertinoColors.secondaryLabel.darkColor,
                          fontSize: 12.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SonorIconButton(
              icon: SonorIcons.more_bold,
              color: CupertinoColors.label.darkColor,
            )
          ],
        ),
      ),
    );
  }
}
