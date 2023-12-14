import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travl/components/feed.dart';
import 'package:travl/utils/c_nav.dart';

Widget buildAndroidNav(
    int selectedTab, Function(int) onTabSelected, Function(int) onItemTapped) {
  return Scaffold(
    appBar: AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: TextButton(
              child: Text('Food',
                  style: TextStyle(
                      color: selectedTab == 0 ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.w700,
                      decoration: selectedTab == 0
                          ? TextDecoration.underline
                          : TextDecoration.none)),
              onPressed: () => onTabSelected(0),
            ),
          ),
          Flexible(
            child: TextButton(
              child: Text('Non-food',
                  style: TextStyle(
                      color: selectedTab == 1 ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.w700,
                      decoration: selectedTab == 1
                          ? TextDecoration.underline
                          : TextDecoration.none)),
              onPressed: () => onTabSelected(1),
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
        children: selectedTab == 0 ? buildFoodCnt() : buildiOSNonFood(),
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
      currentIndex: selectedTab,
      onTap: onItemTapped,
      selectedItemColor: Colors.purple[800],
      // fixedColor: Colors.grey,
      unselectedItemColor: Colors.grey,
    ),
  );
}

Widget buildiOSNav(
    int selectedTab, Function(int) onTabSelected, Function(int) onItemTapped) {
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
        currentIndex: selectedTab,
        onTap: onItemTapped,
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
                      onPressed: () => onTabSelected(0),
                      child: Text('Food',
                          style: TextStyle(
                              color: selectedTab == 0
                                  ? CupertinoColors.black
                                  : CupertinoColors.systemGrey,
                              fontWeight: FontWeight.w700,
                              decoration: selectedTab == 0
                                  ? TextDecoration.underline
                                  : TextDecoration.none)),
                    ),
                  ),
                  Flexible(
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => onTabSelected(1),
                      child: Text('Non-food',
                          style: TextStyle(
                              color: selectedTab == 1
                                  ? CupertinoColors.black
                                  : CupertinoColors.systemGrey,
                              fontWeight: FontWeight.w700,
                              decoration: selectedTab == 1
                                  ? TextDecoration.underline
                                  : TextDecoration.none)),
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
              children: selectedTab == 0 ? buildFoodCnt() : buildiOSNonFood(),
            ),
          ),
        );
      });
}
