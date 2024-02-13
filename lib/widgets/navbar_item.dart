import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavbarIcon extends StatelessWidget {
  const NavbarIcon({
    super.key,
    required this.icon,
    required this.color,
  });

  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: SvgPicture.asset(
        icon,
        color: color,
      ),
    );
  }
}
