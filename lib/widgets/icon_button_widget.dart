import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SonorIconButton extends StatelessWidget {
  const SonorIconButton({
    super.key,
    required this.icon,
    this.color,
    this.size = 24.0,
    this.onTap,
  });

  final String icon;
  final Color? color;
  final double size;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
            /* color: CupertinoColors.systemGrey6.darkColor, */
            borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.all(4.0),
        child: SvgPicture.asset(
          icon,
          color: color,
          height: size,
          width: size,
        ),
      ),
    );
  }
}
