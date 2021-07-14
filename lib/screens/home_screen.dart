import 'package:flutter/material.dart';

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
              Container(child: Center(child: Text("Homepage"))),
              Container(child: Center(child: Text("Favorites"))),
              Container(child: Center(child: Text("Search"))),
              Container(child: Center(child: Text("Profile"))),
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
