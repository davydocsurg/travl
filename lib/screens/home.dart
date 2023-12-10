import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travl/components/avatar.dart';
import 'package:travl/components/card.dart';
import 'package:travl/components/hero.dart';
import 'package:travl/components/navbar.dart';
import 'package:travl/utils/c_button.dart';

class Home extends StatefulWidget {
  final String secTitle = 'Travl - Home';
  final String navTitle = 'Home';

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: _buildiOSNav(),
      );
    } else {
      return MaterialApp(
        title: widget.navTitle,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.navTitle),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Food'),
                  Tab(text: 'Non-food'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Center(child: Text('Food')),
                Center(child: Text('Non-food')),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _buildiOSNav() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text('Food',
                      style: TextStyle(
                          color: _selectedTab == 0
                              ? CupertinoColors.black
                              : CupertinoColors.systemGrey,
                          fontWeight: FontWeight.w700,
                          decoration: _selectedTab == 0
                              ? TextDecoration.underline
                              : TextDecoration.none)),
                  onPressed: () {
                    setState(() {
                      _selectedTab = 0;
                    });
                  },
                ),
              ),
              Flexible(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text('Non-food',
                      style: TextStyle(
                          color: _selectedTab == 1
                              ? CupertinoColors.black
                              : CupertinoColors.systemGrey,
                          fontWeight: FontWeight.w700,
                          decoration: _selectedTab == 1
                              ? TextDecoration.underline
                              : TextDecoration.none)),
                  onPressed: () {
                    setState(() {
                      _selectedTab = 1;
                    });
                  },
                ),
              ),
            ],
          ),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(CupertinoIcons.search, color: Colors.black),
                  SizedBox(width: 10),
                  Icon(Icons.location_on, color: Colors.black),
                  SizedBox(width: 10),
                  Icon(CupertinoIcons.bars, color: Colors.black),
                ],
              ),
            ],
          )),
      child: Padding(
        padding: const EdgeInsets.only(top: 100, left: 12, right: 12),
        child: Column(
          children: _selectedTab == 0 ? _buildiOSFood() : _buildiOSNonFood(),
        ),
      ),
    );
  }

  List<Widget> _buildiOSFood() {
    return [
      SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            PlainCard(
                title: "This is an Ad",
                subtitle:
                    "Help rescue unsold food and share it with the community."),
            SizedBox(height: 15),
            ImageCard(
              imagePath: 'images/travl-bg.jpeg',
              title: 'Donuts',
              widget1: CAvatar(
                imageUrl: 'images/man-bird.jpeg',
                size: 35,
                local: true,
              ),
              widget2: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'David',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.black54),
                  ),
                ),
              ),
              widget3: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow[700]),
                  SizedBox(width: 5),
                  Text(
                    '5.0',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ],
              ),
              button: CButton(
                  text: 'Pick up',
                  fontSize: 13,
                  onPressed: () {
                    print('pickup');
                  },
                  width: double.infinity,
                  height: 35,
                  color: Colors.black,
                  bgColor: Colors.yellow[200]!),
            ),
          ],
        ),
      )
    ];
  }

  List<Widget> _buildiOSNonFood() {
    return [
      SizedBox(
        width: double.infinity,
        child: PlainCard(
            title: "This is an Ad",
            subtitle:
                "Help rescue unsold items and share it with the community."),
      )
    ];
  }
}
