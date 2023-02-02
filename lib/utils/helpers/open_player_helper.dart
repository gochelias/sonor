import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sonor/screens/player_screen.dart';

void openPlayerScreen(
  BuildContext context,
  AudioPlayer audioPlayer,
) {
  showModalBottomSheet(
    useRootNavigator: true,
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 1,
        builder: (context, scrollController) {
          return MediaQuery(
            data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
            child: SafeArea(
              child: PlayerScreen(
                audioPlayer: audioPlayer,
              ),
            ),
          );
        },
      );
    },
  );
}
