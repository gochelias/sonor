import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sonor/icons/icons.dart';
import 'package:sonor/widgets/icon_button_widget.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        leadingWidth: 108,
        leading: Container(
          padding: const EdgeInsets.only(left: 8),
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              SonorIconButton(
                size: 24,
                icon: SonorIcons.arrow_left_linear,
                color: CupertinoColors.white,
                onTap: () => Navigator.of(context).pop(),
              ),
              const Text(
                'Playlists',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        actions: const <Widget>[
          SonorIconButton(
            icon: SonorIcons.search_linear,
            color: CupertinoColors.white,
          ),
          SizedBox(width: 16.0),
          SonorIconButton(
            icon: SonorIcons.menu_bold,
            color: CupertinoColors.white,
          ),
          SizedBox(width: 8.0),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: CupertinoColors.darkBackgroundGray,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Playlist Name',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Some Description",
                      style: TextStyle(
                        fontSize: 12,
                        color: CupertinoColors.secondaryLabel.darkColor,
                      ),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Total time",
                              style: TextStyle(
                                color: CupertinoColors.systemGrey3,
                                fontSize: 12,
                              ),
                            ),
                            Row(
                              children: const <Widget>[
                                SonorIconButton(
                                  icon: SonorIcons.download_linear,
                                  color: CupertinoColors.systemGrey3,
                                ),
                                SizedBox(width: 24),
                                SonorIconButton(
                                  icon: SonorIcons.shuffle_bold,
                                  color: CupertinoColors.systemGrey3,
                                ),
                              ],
                            ),
                          ],
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: CupertinoColors.systemGrey6,
                          child: SvgPicture.asset(
                            SonorIcons.play_bold,
                            color: CupertinoColors.black,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
