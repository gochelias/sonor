import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        child: Center(
          child: Text(
            'Library',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
