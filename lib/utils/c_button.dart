import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color color;
  final Color bgColor;
  final String? emoji;
  final double? borderRadius;

  CButton({
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.color,
    required this.bgColor,
    this.emoji,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final content = emoji == null
        ? Text(
            text,
            style: TextStyle(color: color),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji!),
              SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(color: color),
              ),
            ],
          );

    return Platform.isIOS
        ? Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 18.0),
              color: bgColor,
            ),
            child: CupertinoButton(
              onPressed: onPressed,
              padding: EdgeInsets.zero,
              color: bgColor,
              pressedOpacity: 0.4,
              child: content,
            ),
          )
        : SizedBox(
            width: width,
            height: height,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(bgColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 18.0),
                  ),
                ),
              ),
              child: content,
            ),
          );
  }
}
