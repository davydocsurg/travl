import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travl/api/food.dart';
import 'package:travl/components/avatar.dart';
import 'package:travl/components/card.dart';
import 'package:travl/components/hero.dart';
import 'package:travl/components/navbar.dart';
import 'package:travl/utils/c_button.dart';
import 'package:travl/utils/c_nav.dart';

class Home extends StatefulWidget {
  final String secTitle = 'Travl - Home';
  final String navTitle = 'Home';

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedTab = 0;
  List<MockApi> mockApi = MockApiService.fetchData();
  void _onItemTapped(int index) {
    if (index >= 0 && index < 5) {
      setState(() {
        _selectedTab = index;
      });
    }
  }

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
        debugShowCheckedModeBanner: false,
        home: _buildAndroidNav(),
      );
    }
  }

  Widget _buildiOSNav() {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            CustomBottomNavigationBarItem(
              iconData: CupertinoIcons.house_alt,
              label: 'Home',
            ).buildItem(),
            CustomBottomNavigationBarItem(
              iconData: CupertinoIcons.graph_circle,
              label: 'Goals',
            ).buildItem(),
            CustomBottomNavigationBarItem(
              iconData: CupertinoIcons.add_circled_solid,
              size: 60,
              padding: EdgeInsets.zero,
            ).buildItem(),
            CustomBottomNavigationBarItem(
              iconData: CupertinoIcons.chat_bubble_2,
              label: 'Forum',
            ).buildItem(),
            CustomBottomNavigationBarItem(
              iconData: CupertinoIcons.envelope,
              label: 'Messages',
            ).buildItem(),
          ],
          currentIndex: _selectedTab,
          onTap: _onItemTapped,
          activeColor: Colors.purple[800],
        ),
        tabBuilder: (BuildContext context, int index) {
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
              padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
              child: ListView(
                children:
                    _selectedTab == 0 ? _buildFoodCnt() : _buildiOSNonFood(),
              ),
            ),
          );
        });
  }

  Widget _buildAndroidNav() {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextButton(
                child: Text('Food',
                    style: TextStyle(
                        color: _selectedTab == 0 ? Colors.black : Colors.grey,
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
              child: TextButton(
                child: Text('Non-food',
                    style: TextStyle(
                        color: _selectedTab == 1 ? Colors.black : Colors.grey,
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
        actions: [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.location_on, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.menu, color: Colors.black),
          SizedBox(width: 50),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
        child: ListView(
          children: _selectedTab == 0 ? _buildFoodCnt() : _buildiOSNonFood(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          CustomBottomNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
          ).buildItem(),
          CustomBottomNavigationBarItem(
            iconData: Icons.stacked_bar_chart,
            label: 'Goals',
          ).buildItem(),
          CustomBottomNavigationBarItem(
            iconData: Icons.add_circle_outline,
            size: 60,
            label: '',
            padding: EdgeInsets.zero,
          ).buildItem(),
          CustomBottomNavigationBarItem(
            iconData: Icons.forum,
            label: 'Forum',
          ).buildItem(),
          CustomBottomNavigationBarItem(
            iconData: Icons.message,
            label: 'Messages',
          ).buildItem(),
        ],
        currentIndex: _selectedTab,
        onTap: _onItemTapped,
        selectedItemColor: Colors.purple[800],
        // fixedColor: Colors.grey,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  List<Widget> _buildFoodCnt() {
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
            Column(
              children: List.generate(
                mockApi.length, // Generate 5 ImageCards
                (index) => ImageCard(
                  imagePath: mockApi[index].imagePath,
                  title: mockApi[index].title,
                  widget1: CAvatar(
                    imageUrl: mockApi[index].imageUrl,
                    size: 35,
                    local: true,
                  ),
                  widget2: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        mockApi[index].name,
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
                        mockApi[index].rating,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  widget4: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.black54,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text(
                        mockApi[index].distance,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  widget5: Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.black54,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text(
                        mockApi[index].views,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  widget6: Text(
                    mockApi[index].time,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.green),
                  ),
                  button: CButton(
                      text: 'Pick up',
                      fontSize: Platform.isIOS ? 13 : 11,
                      onPressed: () {
                        print('pickup');
                      },
                      width: double.infinity,
                      height: 35,
                      color: Colors.black,
                      bgColor: Colors.yellow[200]!),
                ),
              ),
            )
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
