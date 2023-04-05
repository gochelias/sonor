import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

import 'package:sonor/icons/icons.dart';
import 'package:sonor/providers/providers.dart';
import 'package:sonor/utils/helpers/helpers.dart';
import 'package:sonor/widgets/widgets.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    SongPlayingProvider songPlayingWatch = context.watch<SongPlayingProvider>();

    final Color color = songPlayingWatch.palette?.darkMutedColor?.color ??
        songPlayingWatch.palette?.mutedColor?.color ??
        CupertinoColors.darkBackgroundGray;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24.0),
        ),
        gradient: LinearGradient(
          colors: <Color>[
            getDarkColor(color),
            color,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: <Widget>[
          QueryArtworkWidget(
            id: songPlayingWatch.songPlaying.id,
            size: 344,
            artworkWidth: 344.0,
            artworkHeight: 344.0,
            keepOldArtwork: true,
            type: ArtworkType.AUDIO,
            artworkFit: BoxFit.cover,
            format: ArtworkFormat.PNG,
            artworkQuality: FilterQuality.medium,
            artworkBorder: BorderRadius.circular(12.0),
            nullArtworkWidget: Container(
              width: 344.0,
              height: 344.0,
              decoration: BoxDecoration(
                color: CupertinoColors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  SonorIcons.musicnote_bold,
                  color: CupertinoColors.white,
                  width: 64.0,
                  height: 64.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          PlayerSlider(
            audioPlayer: audioPlayer,
          ),
          Container(
            margin: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: <Widget>[
                Text(
                  songPlayingWatch.songPlaying.title,
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
                    color: CupertinoColors.label.darkColor.withOpacity(0.6),
                    fontSize: 12.0,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          const PlayerControls(),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SonorIconButton(
                  icon: SonorIcons.repeate_linear,
                  color: CupertinoColors.label.darkColor.withOpacity(0.6),
                ),
                SonorIconButton(
                  icon: SonorIcons.quote_square_linear,
                  color: CupertinoColors.label.darkColor.withOpacity(0.6),
                ),
                SonorIconButton(
                  icon: SonorIcons.more_bold,
                  color: CupertinoColors.label.darkColor.withOpacity(0.6),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
