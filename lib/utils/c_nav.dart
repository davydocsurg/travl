import 'package:flutter/material.dart';

export 'c_nav.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final IconData iconData;
  final String? label;
  final EdgeInsets padding;
  final double? size;
  final Color? bgColor;

  CustomBottomNavigationBarItem(
      {required this.iconData,
      this.label,
      this.padding = const EdgeInsets.only(top: 8),
      this.size,
      this.bgColor});

  BottomNavigationBarItem buildItem() {
    return BottomNavigationBarItem(
      backgroundColor: bgColor,
      icon: Padding(
        padding: padding,
        child: Icon(
          iconData,
          size: size,
          // color: Colors.grey,
        ),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // this won't be used
  }
}
