import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

    return InkWell(
      borderRadius: BorderRadius.circular(0),
      splashColor: CupertinoColors.systemGrey4.darkColor,
      onTap: () => {
        context.read<SongPlayingProvider>().setSong(songPlaying),
        context.read<SongPlayerProvider>().setSong(song.uri!, audioPlayer),
        context.read<SongPlayingProvider>().setIsActive(false),
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                QueryArtworkWidget(
                  id: song.id,
                  type: ArtworkType.AUDIO,
                  artworkHeight: 48.0,
                  artworkWidth: 48.0,
                  keepOldArtwork: true,
                  artworkFit: BoxFit.cover,
                  artworkBorder: BorderRadius.circular(6.0),
                  nullArtworkWidget: Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey6.darkColor,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        SonorIcons.musicnote_bold,
                        color: CupertinoColors.systemGrey.darkColor,
                        width: 22.0,
                        height: 22.0,
                      ),
                    ),
                  ),
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
