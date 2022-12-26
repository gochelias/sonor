import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sonor/icons/icons.dart';

class CardPlaylist extends StatelessWidget {
  const CardPlaylist({super.key, required this.name, this.image});

  final String name;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 124.0,
          height: 70.0,
          decoration: BoxDecoration(
            color: CupertinoColors.darkBackgroundGray,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: image ??
              Container(
                padding: const EdgeInsets.all(20.0),
                child: SvgPicture.asset(
                  SonorIcons.musicnote_bold,
                  color: CupertinoColors.secondaryLabel.darkColor,
                ),
              ),
        ),
        const SizedBox(height: 8.0),
        Text(
          name,
          style: TextStyle(
            color: CupertinoColors.label.darkColor,
            fontWeight: FontWeight.w500,
            fontSize: 12.0,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
