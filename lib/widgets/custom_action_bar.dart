import 'package:flutter/material.dart';
import 'package:shopify/constants/Constants.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  final bool hasTitle;
  final bool hasBlackColor;
  final bool hasBackground;

  CustomActionBar(
      {this.title,
      this.hasBackArrow,
      this.hasTitle,
      this.hasBackground,
      this.hasBlackColor});

  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = this.hasBackArrow ?? false;
    bool _hasTitle = this.hasTitle ?? true;
    bool _hasBlackColor = this.hasBlackColor ?? false;
    bool _hasBackground = this.hasBackground ?? true;

    return Container(
      decoration: BoxDecoration(
          gradient: _hasBackground
              ? LinearGradient(
                  colors: [Colors.white, Colors.white.withOpacity(0)],
                  begin: Alignment(0, 0),
                  end: Alignment(0, 1))
              : null),
      padding: EdgeInsets.only(top: 56, left: 30.0, right: 30.0, bottom: 36.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_hasBackArrow)
            Container(
              height: 42,
              width: 42,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image(
                    image: AssetImage("assets/images/back_arrow.png"),
                    color: _hasBlackColor ? Colors.black : Colors.white),
              ),
              decoration: BoxDecoration(
                  color: _hasBlackColor ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          if (_hasTitle) Text(this.title, style: Constants.boldHeading),
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: _hasBlackColor ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(5.0)),
              alignment: Alignment.center,
              child: Text(
                '0',
                style: TextStyle(
                    color: _hasBlackColor ? Colors.black : Colors.white),
              ))
        ],
      ),
    );
  }
}
