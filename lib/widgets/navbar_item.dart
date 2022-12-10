import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavbarItemIcon extends StatelessWidget {
  const NavbarItemIcon({
    super.key,
    required this.icon,
    required this.selected,
  });

  final String icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: SvgPicture.asset(
        icon,
        color: selected ? const Color(0xFFff385f) : const Color(0xFF626266),
      ),
    );
  }
}
