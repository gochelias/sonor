import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:sonor/icons/icons.dart';
import 'package:sonor/utils/ui/context_menu_item_ui.dart';
import 'package:sonor/utils/ui/context_menu_ui.dart';

class SongContextMenu extends StatelessWidget {
  const SongContextMenu({
    super.key,
    required this.song,
  });

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    final OnAudioQuery audioQuery = OnAudioQuery();

    return ContextMenu(
      title: song.title,
      items: <Widget>[
        ContextMenuItem(
          leading: SvgPicture.asset(
            SonorIcons.trash_linear,
            color: CupertinoColors.systemGrey,
          ),
          title: 'Delete Song',
        ),
        const CustomDivider(),
        ContextMenuItem(
          leading: SvgPicture.asset(
            SonorIcons.share_linear,
            color: CupertinoColors.systemGrey,
          ),
          title: 'Share Song',
        ),
        const CustomDivider(),
        ContextMenuItem(
          onTap: () {
            Navigator.pop(context);

            context.goNamed(
              'song',
              params: {'songId': song.id.toString()},
              extra: song,
            );
          },
          leading: SvgPicture.asset(
            SonorIcons.info_linear,
            color: CupertinoColors.systemGrey,
          ),
          title: 'Song Information',
        ),
        const CustomDivider(),
        ContextMenuItem(
          onTap: () {
            Navigator.pop(context);

            showModalBottomSheet(
              context: context,
              useSafeArea: true,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) {
                return DraggableScrollableSheet(
                  expand: true,
                  minChildSize: 0.5,
                  initialChildSize: 1,
                  builder: (
                    BuildContext context,
                    ScrollController scrollController,
                  ) {
                    return Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6.darkColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
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
                          Flexible(
                            child: ListView.separated(
                              itemCount: 32,
                              padding: const EdgeInsets.only(
                                left: 24,
                                right: 24,
                                top: 16,
                                bottom: 24,
                              ),
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  indent: 96,
                                  color: CupertinoColors.separator.darkColor,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: <Widget>[
                                    Container(
                                      width: 80,
                                      height: 80,
                                      color: CupertinoColors.darkBackgroundGray,
                                    ),
                                    const SizedBox(width: 16),
                                    const Text('Playlist Name'),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
          leading: SvgPicture.asset(
            SonorIcons.music_square_add_linear,
            color: CupertinoColors.systemGrey,
          ),
          title: 'Add to a Playlist',
        ),
        const CustomDivider(),
        ContextMenuItem(
          leading: SvgPicture.asset(
            SonorIcons.quote_square_linear,
            color: CupertinoColors.systemGrey,
          ),
          title: 'View Full Lyrics',
        ),
        const CustomDivider(),
        ContextMenuItem(
          leading: SvgPicture.asset(
            SonorIcons.heart_linear,
            color: CupertinoColors.systemGrey,
          ),
          title: 'Add to Favorites',
        ),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: CupertinoColors.separator.darkColor,
      indent: 38.0,
    );
  }
}
