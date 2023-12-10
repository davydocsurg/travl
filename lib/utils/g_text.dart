import 'package:flutter/material.dart';

class GText extends StatelessWidget {
  final String emoji;
  final String title;
  final String desc;
  final Color? tColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? topPadding;

  GText({
    required this.emoji,
    required this.desc,
    required this.title,
    this.tColor = Colors.black54,
    this.topPadding,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$emoji $title',
            style: TextStyle(
                color: tColor, fontSize: fontSize, fontWeight: fontWeight),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(desc),
          ),
        ],
      ),
    );
  }
}
