import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AddToPlaylist extends StatelessWidget {
  const AddToPlaylist({
    super.key,
    required this.song,
  });

  final int song;

  @override
  Widget build(BuildContext context) {
    final OnAudioQuery audioQuery = OnAudioQuery();

    return DraggableScrollableSheet(
      minChildSize: 0.5,
      initialChildSize: 1,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6.darkColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 80,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 52,
                      height: 5,
                      margin: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey2,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder<List<PlaylistModel>>(
                future: audioQuery.queryPlaylists(
                  sortType: null,
                  orderType: OrderType.ASC_OR_SMALLER,
                  uriType: UriType.EXTERNAL,
                  ignoreCase: true,
                ),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<List<PlaylistModel>> snapshot,
                ) {
                  if (snapshot.data == null) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.data!.isEmpty) {
                    return const Center(child: Text('Not Found'));
                  }

                  return Flexible(
                    child: ListView.separated(
                      controller: scrollController,
                      itemCount: snapshot.data!.length,
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 16,
                        bottom: 24,
                      ),
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          indent: 96,
                          color: CupertinoColors.separator.darkColor,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final PlaylistModel playlist = snapshot.data![index];
                        return Row(
                          children: <Widget>[
                            Container(
                              width: 80,
                              height: 80,
                              color: CupertinoColors.darkBackgroundGray,
                            ),
                            const SizedBox(width: 16),
                            Text(playlist.playlist),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
