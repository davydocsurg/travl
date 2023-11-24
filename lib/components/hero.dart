import 'package:flutter/material.dart';

class HeroSec extends StatelessWidget {
  const HeroSec({
    Key? key,
    required this.imagePath,
    this.height,
    this.width,
    this.fit,
  }) : super(key: key);

  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}
