import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;
  final bool local;

  const CAvatar({
    required this.imageUrl,
    this.size = 100,
    this.local = false,
  });

  @override
  Widget build(BuildContext context) {
    // ImageProvider<Object> imageProvider = local
    //     ? Image.asset(
    //         imageUrl,
    //         height: size,
    //         width: size,
    //       )
    //     : Image.network(
    //         imageUrl,
    //         height: size,
    //         width: size,
    //       );
    if (Platform.isIOS) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: local
                ? Image.asset(
                    imageUrl,
                    height: size,
                    width: size,
                  ).image
                : Image.network(
                    imageUrl,
                    height: size,
                    width: size,
                  ).image,
            fit: BoxFit.cover,
          ),
        ),
        child: local == false ? CupertinoActivityIndicator() : SizedBox(),
      );
    } else {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: local
                ? Image.asset(
                    imageUrl,
                    height: size,
                    width: size,
                  ).image
                : Image.network(
                    imageUrl,
                    height: size,
                    width: size,
                  ).image,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
