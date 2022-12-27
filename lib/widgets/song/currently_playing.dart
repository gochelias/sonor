import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

import 'package:sonor/widgets/widgets.dart';
import 'package:sonor/icons/icons.dart';

class CurrentlyPlaying extends StatelessWidget {
  const CurrentlyPlaying({
    super.key,
    this.artwork,
    required this.name,
    required this.artist,
  });

  final Widget? artwork;
  final String name;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
            decoration: BoxDecoration(
              color: CupertinoColors.darkBackgroundGray,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6.darkColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                      child: artwork ??
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              SonorIcons.musicnote_bold,
                              color: CupertinoColors.secondaryLabel.darkColor,
                            ),
                          ),
                    ),
                    const SizedBox(width: 10.0),
                    SizedBox(
                      width: 190.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                              color: CupertinoColors.label.darkColor,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            artist,
                            style: TextStyle(
                              color: CupertinoColors.secondaryLabel.darkColor,
                              fontSize: 8.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: const <Widget>[
                    SonorIconButton(
                      icon: SonorIcons.play_bold,
                      color: CupertinoColors.white,
                    ),
                    SizedBox(width: 8.0),
                    SonorIconButton(
                      icon: SonorIcons.next_bold,
                      color: CupertinoColors.white,
                    ),
                    SizedBox(width: 6.0),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ProgressBar(
              barHeight: 2.0,
              thumbRadius: 1.0,
              thumbColor: Colors.transparent,
              progressBarColor: CupertinoColors.white,
              baseBarColor: CupertinoColors.black,
              timeLabelLocation: TimeLabelLocation.none,
              progress: Duration(seconds: 98),
              total: Duration(seconds: 198),
            ),
          )
        ],
      ),
    );
  }
}
