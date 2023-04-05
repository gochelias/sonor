import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:palette_generator/palette_generator.dart';

/// Generates a color palette based on an image
/// * [id] `int` Image id, used to find and get image
/// * [type] `ArtworkType` Defines where artwork will be acquired.
Future<PaletteGenerator?> paletteGenerator(int id, ArtworkType type) async {
  final Uint8List? image = await OnAudioQuery().queryArtwork(id, type);

  if (image == null) return null;

  final PaletteGenerator palette = await PaletteGenerator.fromImageProvider(
    Image.memory(image).image,
  );

  return palette;
}
