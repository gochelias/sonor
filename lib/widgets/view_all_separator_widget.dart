import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class ViewAllSeparator extends StatelessWidget {
  const ViewAllSeparator({
    super.key,
    required this.label,
    required this.routeName,
    this.marginTop = 32.0,
  });

  final String label;
  final String routeName;
  final double marginTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: marginTop,
        bottom: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              color: CupertinoColors.label.darkColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () => context.go('/$routeName'),
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.only(left: 4.0, top: 2.0, bottom: 2.0),
              child: Text(
                'View all',
                style: TextStyle(
                  color: CupertinoColors.secondaryLabel.darkColor,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
