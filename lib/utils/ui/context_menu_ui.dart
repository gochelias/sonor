import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void contextMenu(BuildContext context, String title, List<Widget> items,
    {double? height = 600.0}) {
  showDialog(
    context: context,
    builder: (context) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6.darkColor,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 16.0),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: items,
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 18,
                        color: CupertinoColors.systemPink.darkColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
