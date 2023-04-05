import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class PlayerSlider extends StatefulWidget {
  const PlayerSlider({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  State<PlayerSlider> createState() => _PlayerSliderState();
}

class _PlayerSliderState extends State<PlayerSlider> {
  Duration duration = const Duration();
  Duration position = const Duration();

  @override
  void initState() {
    super.initState();

    widget.audioPlayer.durationStream.listen((Duration? d) {
      if (mounted) {
        setState(() {
          duration = d!;
        });
      }
    });

    widget.audioPlayer.positionStream.listen((Duration p) {
      if (mounted) {
        setState(() {
          position = p;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          ProgressBar(
            barHeight: 4.0,
            thumbColor: Colors.white,
            thumbRadius: 4.0,
            timeLabelPadding: 6.0,
            progressBarColor: CupertinoColors.white,
            baseBarColor: CupertinoColors.label.darkColor.withOpacity(0.2),
            timeLabelTextStyle: TextStyle(
              color: CupertinoColors.label.darkColor.withOpacity(0.6),
              fontSize: 12.0,
            ),
            progress: Duration(milliseconds: position.inMilliseconds.toInt()),
            total: Duration(milliseconds: duration.inMilliseconds.toInt()),
            onSeek: (Duration value) {
              widget.audioPlayer.seek(value);
            },
          ),
        ],
      ),
    );
  }
}
