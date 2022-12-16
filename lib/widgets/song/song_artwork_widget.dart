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
    this.size,
    this.quality,
  });

  final int id;
  final ArtworkType type;
  final int? size;
  final int? quality;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: OnAudioQuery().queryArtwork(
        id,
        type,
        format: ArtworkFormat.JPEG,
        size: size ?? 200,
        quality: quality ?? 100,
      ),
      builder: (context, snapshot) {
        if (snapshot.data != null && snapshot.data!.isNotEmpty) {
          return Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6.darkColor,
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: MemoryImage(
                  snapshot.data!,
                  scale: 1.0,
                ),
              ),
            ),
          );
        }
        return Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6.darkColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              SonorIcons.musicnote_bold,
              color: CupertinoColors.white,
              width: 22.0,
              height: 22.0,
            ),
          ),
        );
      },
    );
  }
}
