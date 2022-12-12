import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SonorIconButton extends StatelessWidget {
  const SonorIconButton({
    super.key,
    this.onTap,
    required this.icon,
    this.color,
  });

  final void Function()? onTap;
  final String icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 32.0,
        height: 32.0,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          icon,
          color: color,
          height: 22.0,
          width: 22.0,
        ),
      ),
    );
  }
}
