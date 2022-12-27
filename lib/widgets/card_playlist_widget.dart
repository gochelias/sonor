import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sonor/icons/icons.dart';

class CardPlaylist extends StatelessWidget {
  const CardPlaylist({
    super.key,
    this.image,
    required this.name,
    required this.size,
    required this.fontSize,
    this.max = false,
    this.total,
  });

  final String name;
  final Widget? image;
  final double size;
  final double fontSize;
  final bool max;
  final int? total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          max ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: CupertinoColors.darkBackgroundGray,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: image ??
              Container(
                padding: const EdgeInsets.all(24.0),
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
            fontSize: fontSize,
          ),
          textAlign: max ? TextAlign.start : TextAlign.center,
          maxLines: max ? 1 : 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4.0),
        if (max)
          Text(
            '$total Songs',
            style: TextStyle(
              color: CupertinoColors.secondaryLabel.darkColor,
              fontSize: 12.0,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
      ],
    );
  }
}
