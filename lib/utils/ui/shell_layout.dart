import 'package:flutter/material.dart';

import 'package:sonor/widgets/widgets.dart';

class SonorShellLayout extends StatelessWidget {
  const SonorShellLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            child,
            /* const Positioned(
              bottom: 4.0,
              child: CurrentlyPlaying(),
            ) */
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const SonorBottomNavbar(),
    );
  }
}
