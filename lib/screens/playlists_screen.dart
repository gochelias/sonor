import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification notification) {
        notification.disallowIndicator();
        return false;
      },
      child: Scrollbar(
        radius: const Radius.circular(100),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 6.0);
          },
          itemCount: 1,
          padding: const EdgeInsets.only(
            left: 10,
            right: 10.0,
            top: 20.0,
            bottom: 80.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              highlightColor: CupertinoColors.darkBackgroundGray,
              splashColor: CupertinoColors.systemGrey5.darkColor,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 64.0,
                      height: 64.0,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey5.darkColor,
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://images.squarespace-cdn.com/content/v1/5b788d28697a98e17a6d4c7a/51f8c36c-5695-40cf-b278-3dcc05ae5c42/dark+academia+playlist.png?format=70w',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    SizedBox(
                      width: 224.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Playlist Name',
                            style: TextStyle(
                              color: CupertinoColors.label.darkColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 6.0),
                          Text(
                            'Total Songs',
                            style: TextStyle(
                              color: CupertinoColors.systemGrey2.darkColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
