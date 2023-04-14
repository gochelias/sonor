import 'package:flutter/cupertino.dart';

class ContextMenuItem extends StatelessWidget {
  const ContextMenuItem({
    super.key,
    this.onTap,
    required this.leading,
    required this.title,
  });

  final void Function()? onTap;
  final Widget leading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: <Widget>[
            leading,
            const SizedBox(width: 16.0),
            Text(
              title,
              style: const TextStyle(
                color: CupertinoColors.systemGrey4,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
