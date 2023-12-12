import 'package:flutter/material.dart';

export 'c_nav.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final IconData iconData;
  final String label;
  final EdgeInsets padding;
  final double? size;

  CustomBottomNavigationBarItem(
      {required this.iconData,
      required this.label,
      this.padding = const EdgeInsets.only(top: 8),
      this.size});

  BottomNavigationBarItem buildItem() {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: padding,
        child: Icon(iconData, size: size),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // this won't be used
  }
}
