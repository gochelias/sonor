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
        child: Stack(
          children: <Widget>[
            child,
            const Positioned(
              bottom: 0.0,
              child: SonorBottomNavbar(),
            )
          ],
        ),
      ),
    );
  }
}
