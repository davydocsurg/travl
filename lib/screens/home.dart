import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travl/components/navbar.dart';

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
        home: CupertinoPageScaffold(
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(CupertinoIcons.search),
                SizedBox(width: 10),
                Icon(Icons.location_on),
                SizedBox(width: 10),
                Icon(CupertinoIcons.bars),
              ],
            ),
          ),
          child: Center(
            child: Text('Content here'),
          ),
        ),
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
}
