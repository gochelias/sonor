import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:sonor/icons/icons.dart';
import 'package:sonor/utils/ui/context_menu_item_ui.dart';
import 'package:sonor/utils/ui/context_menu_ui.dart';
import 'package:sonor/widgets/widgets.dart';

class SongContextMenu extends StatelessWidget {
  const SongContextMenu({
    super.key,
    required this.song,
  });

  final SongModel song;

  @override
  Widget build(BuildContext context) {
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
                return AddToPlaylist(song: song.id);
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
