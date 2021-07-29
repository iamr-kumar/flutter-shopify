import 'package:flutter/material.dart';
import 'package:shopify/constants/Constants.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;

  CustomActionBar({this.title, this.hasBackArrow});

  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = this.hasBackArrow ?? false;

    return Container(
      padding: EdgeInsets.only(top: 56, left: 30.0, right: 30.0, bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_hasBackArrow)
            Container(
              height: 40,
              width: 40,
              child: Image(
                  image: AssetImage("assets/images/back_arrow.png"),
                  height: 20,
                  width: 20,
                  color: Colors.white),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          Text(this.title, style: Constants.boldHeading),
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5.0)),
              alignment: Alignment.center,
              child: Text(
                '0',
                style: const TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
