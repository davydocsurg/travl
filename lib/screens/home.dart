import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travl/api/food.dart';
import 'package:travl/components/card.dart';

import 'package:travl/components/feed.dart';
import 'package:travl/components/feed_nav.dart';
import 'package:travl/utils/c_nav.dart';

class Home extends StatefulWidget {
  final String secTitle = 'Travl - Home';
  final String navTitle = 'Home';

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedTab = 0;
  void _onItemTapped(int index) {
    if (index >= 0 && index < 5) {
      setState(() {
        _selectedTab = index;
      });
    }
  }

  void onTabSelected(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _selectedTab = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: buildiOSNav(_selectedTab, onTabSelected, _onItemTapped),
      );
    } else {
      return MaterialApp(
        title: widget.navTitle,
        debugShowCheckedModeBanner: false,
        home: buildAndroidNav(_selectedTab, onTabSelected, _onItemTapped),
      );
    }
  }
}
