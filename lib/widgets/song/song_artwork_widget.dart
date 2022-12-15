import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Artwork extends StatelessWidget {
  const Artwork({
    super.key,
    required this.id,
    required this.type,
  });

  final int id;
  final ArtworkType type;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: OnAudioQuery().queryArtwork(
        id,
        type,
        format: ArtworkFormat.JPEG,
        size: 200,
        quality: 100,
      ),
      builder: (context, snapshot) {
        if (snapshot.data != null && snapshot.data!.isNotEmpty) {
          return Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6.darkColor,
              borderRadius: BorderRadius.circular(6.0),
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
        );
      },
    );
  }
}
