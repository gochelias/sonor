import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sonor/greetings.dart';
import 'package:sonor/widgets/widgets.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recent = [
      const Album(
        name: "name",
      ),
      const Artists(
        name: 'name',
      ),
      const Album(
        name: 'name',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 6.0, bottom: 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 80.0,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    greetings(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                  const SonorIconButton(
                    icon: 'assets/icons/setting_linear.svg',
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const TabsSection(),
            const SizedBox(height: 32.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Recently Played',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 150.0,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 16.0,
                  mainAxisExtent: 110.0,
                ),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index) {
                  return recent[index];
                },
              ),
            ),
            const SizedBox(height: 24.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Popular Playlist',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 292.0,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  mainAxisExtent: 138.0,
                ),
                itemCount: 6,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemGrey6.darkColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'PIANO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
