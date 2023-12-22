import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travl/components/avatar.dart';
import 'package:travl/components/hero.dart';
import 'package:travl/components/navbar.dart';
import 'package:travl/utils/c_button.dart';

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
                  child: ListView(
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
        debugShowCheckedModeBanner: false,
        title: 'Travl App',
        home: Scaffold(
          body: Stack(
            children: [
              CNavBar(
                title: "Donuts",
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: ListView(
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
      ),
      Container(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 15),
          child: Text(
            'Food',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black54),
          ),
        ),
      ),
      Container(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 15),
          child: Text(
            'Pick-up times',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.black54),
          ),
        ),
      ),
      Container(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 4),
          child: Text(
            '4.50',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black54),
          ),
        ),
      ),
      SizedBox(
        height: 22,
      ),
      Container(
        alignment: Alignment.topLeft,
        color: Colors.grey[100],
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8, top: 22, bottom: 22, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Everything in this section is given away for free 💚.',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54),
              ),
              Text(
                'Strictly no selling, no swaps, no donations.',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 22,
      ),
      Container(
        alignment: Alignment.topLeft,
        color: Colors.grey[100],
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8, top: 22, bottom: 22, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MAP GOES HERE.',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 22,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CButton(
            text: 'View Messages',
            onPressed: () {},
            width: 200,
            height: 50,
            color: Colors.white,
            bgColor: Colors.purple[500]!),
      )
    ];
  }
}
