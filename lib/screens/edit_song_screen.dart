import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:sonor/icons/icons.dart';
import 'package:sonor/widgets/icon_button_widget.dart';

class EditSong extends StatelessWidget {
  const EditSong({
    super.key,
    required this.song,
  });

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: AppBar(
            elevation: 0,
            leadingWidth: 34,
            leading: SonorIconButton(
              icon: SonorIcons.arrow_left_linear,
              color: CupertinoColors.white,
              onTap: () => Navigator.of(context).pop(),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(
                    CupertinoColors.label.darkColor,
                  ),
                ),
                child: const Text('Done'),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      QueryArtworkWidget(
                        id: song.id,
                        size: 400,
                        artworkWidth: 300,
                        artworkHeight: 300,
                        keepOldArtwork: true,
                        type: ArtworkType.AUDIO,
                        artworkFit: BoxFit.cover,
                        format: ArtworkFormat.PNG,
                        artworkQuality: FilterQuality.medium,
                        artworkBorder: BorderRadius.circular(12.0),
                        nullArtworkWidget: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            color: CupertinoColors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              SonorIcons.musicnote_bold,
                              color: CupertinoColors.white,
                              width: 64.0,
                              height: 64.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: Material(
                          elevation: 12,
                          shadowColor: CupertinoColors.black,
                          borderRadius: BorderRadius.circular(100),
                          color: CupertinoColors.systemGrey6.darkColor,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(100),
                            child: Center(
                              child: SvgPicture.asset(
                                SonorIcons.camera_bold,
                                color: CupertinoColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: 300,
                  child: TextField(
                    maxLines: 1,
                    cursorColor: CupertinoColors.white,
                    decoration: InputDecoration(
                      counterText: '',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: CupertinoColors.separator.darkColor,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: CupertinoColors.separator.darkColor,
                        ),
                      ),
                      label: Text(
                        'name'.toUpperCase(),
                        style: TextStyle(
                          color: CupertinoColors.secondaryLabel.darkColor,
                          fontSize: 14,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintStyle: TextStyle(
                        color: CupertinoColors.label.darkColor,
                        fontSize: 16,
                      ),
                      hintText: song.title,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 300,
                  /* color: Colors.grey.withOpacity(0.2), */
                  child: TextField(
                    maxLines: 1,
                    cursorColor: CupertinoColors.white,
                    decoration: InputDecoration(
                      counterText: '',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: CupertinoColors.separator.darkColor,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: CupertinoColors.separator.darkColor,
                        ),
                      ),
                      label: Text(
                        'Artist'.toUpperCase(),
                        style: TextStyle(
                          color: CupertinoColors.secondaryLabel.darkColor,
                          fontSize: 14,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintStyle: TextStyle(
                        color: CupertinoColors.label.darkColor,
                        fontSize: 16,
                      ),
                      hintText: song.artist ?? '<?>',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  child: TextField(
                    maxLength: 1,
                    cursorColor: CupertinoColors.white,
                    decoration: InputDecoration(
                      counterText: '',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: CupertinoColors.separator.darkColor,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: CupertinoColors.separator.darkColor,
                        ),
                      ),
                      label: Text(
                        'Album'.toUpperCase(),
                        style: TextStyle(
                          color: CupertinoColors.secondaryLabel.darkColor,
                          fontSize: 14,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintStyle: TextStyle(
                        color: CupertinoColors.label.darkColor,
                        fontSize: 16,
                      ),
                      hintText: song.album ?? '<?>',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
