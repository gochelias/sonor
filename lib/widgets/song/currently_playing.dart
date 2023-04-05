import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

import 'package:sonor/providers/providers.dart';
import 'package:sonor/utils/helpers/helpers.dart';
import 'package:sonor/widgets/widgets.dart';
import 'package:sonor/icons/icons.dart';

class CurrentlyPlaying extends StatelessWidget {
  const CurrentlyPlaying({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SongPlayingProvider songPlayingWatch =
        context.watch<SongPlayingProvider>();

    final SongPlayerProvider songPlayerWatch =
        context.watch<SongPlayerProvider>();

    final SongPlayerProvider songPlayerRead =
        context.read<SongPlayerProvider>();

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              openPlayerScreen(context, songPlayerRead.audioPlayer);
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 4.0,
              ),
              decoration: BoxDecoration(
                color: songPlayingWatch.palette?.darkMutedColor?.color ??
                    songPlayingWatch.palette?.mutedColor?.color ??
                    CupertinoColors.darkBackgroundGray,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      QueryArtworkWidget(
                        id: songPlayingWatch.songPlaying.id,
                        type: ArtworkType.AUDIO,
                        artworkWidth: 40.0,
                        artworkHeight: 40.0,
                        keepOldArtwork: true,
                        artworkFit: BoxFit.cover,
                        artworkBorder: BorderRadius.circular(6.0),
                        nullArtworkWidget: Container(
                          width: 40.0,
                          height: 40.0,
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
                      const SizedBox(width: 10.0),
                      SizedBox(
                        width: 190.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              songPlayingWatch.songPlaying.title,
                              style: TextStyle(
                                color: CupertinoColors.label.darkColor,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              songPlayingWatch.songPlaying.artist,
                              style: TextStyle(
                                color: CupertinoColors.label.darkColor
                                    .withOpacity(0.6),
                                fontSize: 8.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SonorIconButton(
                        onTap: () {
                          songPlayerRead.setState(!songPlayerWatch.isPlaying);
                        },
                        icon: songPlayerWatch.isPlaying
                            ? SonorIcons.pause_bold
                            : SonorIcons.play_bold,
                        color: CupertinoColors.white,
                      ),
                      const SizedBox(width: 8.0),
                      const SonorIconButton(
                        icon: SonorIcons.next_bold,
                        color: CupertinoColors.white,
                      ),
                      const SizedBox(width: 6.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
