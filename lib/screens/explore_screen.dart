import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        child: Center(
          child: Text(
            'Explore',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
