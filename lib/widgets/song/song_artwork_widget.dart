import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:sonor/icons/icons.dart';

class Artwork extends StatelessWidget {
  const Artwork({
    super.key,
    required this.id,
    required this.type,
    this.size = 200,
    this.quality = 100,
    this.borderRadius = 12.0,
    this.iconSize = 22.0,
    required this.containerSize,
  });

  final int id;
  final ArtworkType type;
  final int size;
  final int quality;
  final double borderRadius;
  final double iconSize;
  final double containerSize;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: OnAudioQuery().queryArtwork(
        id,
        type,
        format: ArtworkFormat.PNG,
        size: size,
        quality: quality,
      ),
      builder: (context, snapshot) {
        if (snapshot.data != null && snapshot.data!.isNotEmpty) {
          return Container(
            width: containerSize,
            height: containerSize,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6.darkColor,
              borderRadius: BorderRadius.circular(borderRadius),
              image: DecorationImage(
                image: MemoryImage(
                  snapshot.data!,
                  scale: 1.0,
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        }
        return Container(
          width: containerSize,
          height: containerSize,
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6.darkColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              SonorIcons.musicnote_bold,
              color: CupertinoColors.white,
              width: iconSize,
              height: iconSize,
            ),
          ),
        );
      },
    );
  }
}
