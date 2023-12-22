import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travl/components/avatar.dart';
import 'package:travl/components/hero.dart';
import 'package:travl/components/navbar.dart';

class ItemDetails extends StatelessWidget {
  final String secTitle = 'Travl - Details';
  void onBack() {}

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: secTitle,
        home: CupertinoPageScaffold(
          child: Stack(
            children: [
              CNavBar(
                title: "Donuts",
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Column(
                    children: [
                      _buildHeroSection(),
                      ..._buildItemBody(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return MaterialApp(
        title: 'Travl App',
        home: Scaffold(
          body: Stack(),
        ),
      );
    }
  }

  Widget _buildHeroSection() {
    return HeroSec(
        imagePath: 'images/food/donut.jpeg',
        width: double.infinity,
        height: 250);
  }

  List<Widget> _buildItemBody() {
    return [
      Container(
        alignment: Alignment.topRight,
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.share_sharp,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Share',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.heart_broken,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '0 likes',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, top: 15),
        child: Row(
          children: [
            CAvatar(
              imageUrl: 'images/man-bird.jpeg',
              local: true,
              size: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'David is giving away',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                  Text(
                    'Donuts',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_filled,
                        color: Colors.black54,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Added 5 minutes ago',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        '•',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Personal',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    ];
  }
}
