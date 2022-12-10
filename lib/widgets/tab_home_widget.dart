import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class TabIconHome extends StatelessWidget {
  const TabIconHome({
    super.key,
    required this.icon,
    required this.label,
    required this.path,
  });

  final String icon;
  final String label;
  final String path;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(path);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        decoration: BoxDecoration(
          color: const Color(0xFF1c1c1e),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              icon,
              color: const Color(0xFFff385f),
            ),
            const SizedBox(width: 14.0),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
