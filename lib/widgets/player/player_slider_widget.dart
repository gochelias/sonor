import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class SonorSlider extends StatefulWidget {
  const SonorSlider({super.key, required this.player});

  final AudioPlayer player;

  @override
  State<SonorSlider> createState() => _SonorSliderState();
}

class _SonorSliderState extends State<SonorSlider> {
  Duration duration = const Duration();
  Duration position = const Duration();

  @override
  void initState() {
    super.initState();

    widget.player.durationStream.listen((event) {
      if (mounted) {
        setState(() {
          duration = event!;
        });
      }
    });

    widget.player.positionStream.listen((event) {
      if (mounted) {
        setState(() {
          position = event;
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
            baseBarColor: CupertinoColors.systemGrey4.darkColor,
            timeLabelTextStyle: TextStyle(
              color: CupertinoColors.systemGrey.darkColor,
              fontSize: 12.0,
            ),
            progress: Duration(milliseconds: position.inMilliseconds.toInt()),
            total: Duration(milliseconds: duration.inMilliseconds.toInt()),
            onSeek: (value) {
              widget.player.seek(value);
            },
          ),
        ],
      ),
    );
  }
}
