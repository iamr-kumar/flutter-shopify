import 'package:flutter/material.dart';
import 'package:shopify/tabs/home_tab.dart';
import 'package:shopify/tabs/profile_tab.dart';
import 'package:shopify/tabs/saved_tab.dart';
import 'package:shopify/tabs/search_tab.dart';

import 'package:shopify/widgets/bottom_tabs.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;
  int _selectedTab = 0;

  @override
  void initState() {
    pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: (num) {
              setState(() {
                _selectedTab = num;
              });
            },
            children: [
              HomeTab(),
              SavedTab(),
              SearchTab(),
              ProfileTab(),
            ],
          ),
        ),
        Container(
            child: BottomTabs(
          selectedTab: _selectedTab,
          tabPressed: (num) {
            pageController.animateToPage(num,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOutCubic);
          },
        ))
      ],
    ));
  }
}
