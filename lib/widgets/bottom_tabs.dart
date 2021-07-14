import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;

  BottomTabs({this.selectedTab, this.tabPressed});

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 0;

    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30.0,
            spreadRadius: 1.0)
      ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        BottomTabsButton(
          imagePath: "assets/images/tab_home.png",
          isSelected: _selectedTab == 0 ? true : false,
          onPressed: () {
            widget.tabPressed(0);
          },
        ),
        BottomTabsButton(
          imagePath: "assets/images/tab_saved.png",
          isSelected: _selectedTab == 1 ? true : false,
          onPressed: () {
            widget.tabPressed(1);
          },
        ),
        BottomTabsButton(
          imagePath: "assets/images/tab_search.png",
          isSelected: _selectedTab == 2 ? true : false,
          onPressed: () {
            widget.tabPressed(2);
          },
        ),
        BottomTabsButton(
          imagePath: "assets/images/tab_profile.png",
          isSelected: _selectedTab == 3 ? true : false,
          onPressed: () {
            widget.tabPressed(3);
          },
        ),
      ]),
    );
  }
}

class BottomTabsButton extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  final Function onPressed;

  BottomTabsButton({this.imagePath, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = isSelected ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: _selected
                        ? Theme.of(context).accentColor
                        : Colors.transparent,
                    width: 2))),
        child: Image(
          height: 26,
          width: 26,
          image: AssetImage(imagePath ?? "assets/images/tab_home.png"),
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
