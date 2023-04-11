import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sonor/icons/icons.dart';
import 'package:sonor/utils/ui/context_menu_item_ui.dart';

final List<Widget> songContextMenuItems = <Widget>[
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
];

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
