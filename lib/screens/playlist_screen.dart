import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        child: Center(
          child: Text(
            'Playlist',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
