import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

import 'package:sonor/providers/providers.dart';
import 'package:sonor/widgets/widgets.dart';
import 'package:sonor/icons/icons.dart';

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
    final SongPlayingProvider songPlayingWatch =
        context.watch<SongPlayingProvider>();

    SongPlaying songPlaying = SongPlaying(
      song.id,
      song.title,
      song.artist ?? '<unknown>',
    );

    /* void openPlayerScreen(BuildContext context) {
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
                  child: PlayerScreen(
                    audioPlayer: audioPlayer,
                  ),
                ),
              );
            },
          );
        },
      );
    } */

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      highlightColor: CupertinoColors.systemGrey6.darkColor,
      splashColor: Colors.transparent,
      onTap: () => {
        context.read<SongPlayingProvider>().setSong(songPlaying),
        context.read<SongPlayerProvider>().setSong(song.uri!, audioPlayer),
        /* openPlayerScreen(context), */
        context.read<SongPlayingProvider>().setIsActive(false),
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 6.0,
          right: 0.0,
          top: 6.0,
          bottom: 6.0,
        ),
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
                          color: songPlayingWatch.songPlaying.id == song.id
                              ? CupertinoColors.systemPink.darkColor
                              : CupertinoColors.label.darkColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        song.artist ?? '<unknown>',
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
