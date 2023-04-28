import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToPlaylist extends StatelessWidget {
  const AddToPlaylist({
    super.key,
    required this.song,
  });

  final int song;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      minChildSize: 0.5,
      initialChildSize: 1,
      builder: (
        BuildContext context,
        ScrollController scrollController,
      ) {
        return Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6.darkColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 80,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 52,
                      height: 5,
                      margin: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey2,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView.separated(
                  itemCount: 32,
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 16,
                    bottom: 24,
                  ),
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      indent: 96,
                      color: CupertinoColors.separator.darkColor,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 80,
                          color: CupertinoColors.darkBackgroundGray,
                        ),
                        const SizedBox(width: 16),
                        const Text('Playlist Name'),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
