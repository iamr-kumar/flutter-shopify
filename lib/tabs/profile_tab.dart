import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shopify/widgets/custom_action_bar.dart';
import 'package:shopify/widgets/profile_column.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 150,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/user.png"),
              backgroundColor: Colors.transparent,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                "John Doe",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Divider(
              color: Theme.of(context).accentColor,
              thickness: 1,
              height: 20,
            ),
            ProfileColumn("My Orders"),
            ProfileColumn("Settings"),
            ProfileColumn("Privacy"),
          ]),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 65,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
          ),
        ),
        CustomActionBar(
          hasBackArrow: false,
          title: "My Account",
        )
      ],
    );
  }
}
