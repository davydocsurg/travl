import 'package:flutter/material.dart';

class TitleSec extends StatelessWidget {
  const TitleSec({
    Key? key,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.descColor,
    this.iconColor,
    required this.description,
  }) : super(key: key);

  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String description;
  final Color? descColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      color: color,
                    ),
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: iconColor,
          ),
          const Text('41'),
        ],
      ),
    );
  }
}
