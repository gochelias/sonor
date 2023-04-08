import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:sonor/icons/icons.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OnAudioQuery audioQuery = OnAudioQuery();

    return FutureBuilder(
      future: audioQuery.queryPlaylists(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      ),
      builder:
          (BuildContext context, AsyncSnapshot<List<PlaylistModel>> snapshot) {
        if (snapshot.data == null) return const CircularProgressIndicator();
        if (snapshot.data!.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'No playlist found',
                  style: TextStyle(
                    color: CupertinoColors.label.darkColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  'Create your first playlist',
                  style: TextStyle(
                    color: CupertinoColors.secondaryLabel.darkColor,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(height: 36.0),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: const Text(
                      'Create playlist',
                      style: TextStyle(
                        color: CupertinoColors.label,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }

        return CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: snapshot.data!.length,
                (BuildContext context, int index) {
                  final PlaylistModel playlist = snapshot.data![index];
                  return InkWell(
                    onTap: () {},
                    highlightColor: CupertinoColors.darkBackgroundGray,
                    splashColor: CupertinoColors.systemGrey5.darkColor,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 64.0,
                            height: 64.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: CupertinoColors.darkBackgroundGray,
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: SvgPicture.asset(
                              SonorIcons.musicnote_bold,
                              color: CupertinoColors.systemGrey2.darkColor,
                              width: 32.0,
                              height: 32.0,
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          SizedBox(
                            width: 224.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  playlist.playlist,
                                  style: TextStyle(
                                    color: CupertinoColors.label.darkColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 6.0),
                                Text(
                                  playlist.numOfSongs.toString(),
                                  style: TextStyle(
                                    color:
                                        CupertinoColors.systemGrey2.darkColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
