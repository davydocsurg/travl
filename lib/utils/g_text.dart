import 'package:flutter/material.dart';

class GText extends StatelessWidget {
  final String emoji;
  final String title;
  final String desc;
  final double? topPadding;

  GText({
    required this.emoji,
    required this.desc,
    required this.title,
    this.topPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$emoji $title'),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(desc),
          ),
        ],
      ),
    );
  }
}
