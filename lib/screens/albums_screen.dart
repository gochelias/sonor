import 'package:flutter/material.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.black,
        title: const Text(
          'Albums',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SizedBox(
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(
            top: 4.0,
            right: 14.0,
            bottom: 80.0,
            left: 14.0,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14.0,
            crossAxisSpacing: 14.0,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white,
            );
          },
        ),
      ),
    );
  }
}
