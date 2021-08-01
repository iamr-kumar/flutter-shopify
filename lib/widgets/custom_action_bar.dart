import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopify/constants/Constants.dart';
import 'package:shopify/screens/cart_screen.dart';

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

  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection('Users');

  final User _user = FirebaseAuth.instance.currentUser;

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
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 42,
                width: 42,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Image(
                      image: AssetImage("assets/images/back_arrow.png"),
                      color: _hasBlackColor ? Colors.black : Colors.white),
                ),
                decoration: BoxDecoration(
                    color: _hasBlackColor
                        ? Colors.white.withOpacity(0.7)
                        : Colors.black,
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          if (_hasTitle) Text(this.title, style: Constants.boldHeading),
          StreamBuilder(
              stream: _usersRef.doc(_user.uid).collection('Cart').snapshots(),
              builder: (context, snapshot) {
                int _totalItem = 0;

                if (snapshot.connectionState == ConnectionState.active) {
                  List document = snapshot.data.docs;
                  _totalItem = document.length;
                }
                return GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen())),
                  child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          color: _totalItem > 0
                              ? Theme.of(context).accentColor
                              : _hasBlackColor
                                  ? Colors.white.withOpacity(0.7)
                                  : Colors.black,
                          borderRadius: BorderRadius.circular(5.0)),
                      alignment: Alignment.center,
                      child: Text(
                        '$_totalItem' ?? '0',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: _totalItem > 0
                                ? Colors.white
                                : _hasBlackColor
                                    ? Colors.black
                                    : Colors.white),
                      )),
                );
              })
        ],
      ),
    );
  }
}
