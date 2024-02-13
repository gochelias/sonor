import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:sonor/icons/icons.dart';
import 'package:sonor/providers/providers.dart';
import 'package:sonor/widgets/widgets.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    final SongPlayerProvider songPlayerWatch =
        context.watch<SongPlayerProvider>();

    final SongPlayerProvider songPlayerRead =
        context.read<SongPlayerProvider>();

    void buttonPrevious() {}
    void buttonNext() {}

    return Container(
      height: 60.0,
      margin: const EdgeInsets.only(bottom: 52.0, top: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SonorIconButton(
            onTap: () => buttonPrevious(),
            icon: SonorIcons.previous_bold,
            color: CupertinoColors.white,
            size: 36.0,
          ),
          SonorIconButton(
            onTap: () {
              songPlayerRead.setState(!songPlayerWatch.isPlaying);
            },
            icon: songPlayerWatch.audioPlayer.playing
                ? SonorIcons.pause_bold
                : SonorIcons.play_bold,
            color: CupertinoColors.white,
            size: 44.0,
          ),
          SonorIconButton(
            onTap: () => buttonNext(),
            icon: SonorIcons.next_bold,
            color: CupertinoColors.white,
            size: 36.0,
          ),
        ],
      ),
    );
  }
}
