import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Artists extends StatelessWidget {
  const Artists({
    super.key,
    /* required this.image, */
    required this.name,
  });

  /* final String image; */
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          Container(
            width: 110.0,
            height: 110.0,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6.darkColor,
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 12.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
