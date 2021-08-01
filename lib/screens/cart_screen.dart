import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopify/constants/Constants.dart';
import 'package:shopify/widgets/custom_action_bar.dart';
import 'package:shopify/widgets/single_cart_item.dart';

class CartScreen extends StatelessWidget {
  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection('Users');

  final User _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
              future: _usersRef.doc(_user.uid).collection('Cart').get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView(
                      padding: EdgeInsets.only(top: 120, bottom: 12),
                      children: snapshot.data.docs.map((doc) {
                        return Container(child: SingleCartItem(doc));
                      }).toList());
                }

                return Center(child: CircularProgressIndicator());
              }),
          CustomActionBar(
            title: "Cart",
            hasBackArrow: true,
          ),
          Positioned(
              child: Container(
                  height: 65,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text('Proceed to Checkout',
                      style: Constants.regularHeading)),
              bottom: 20,
              left: 0,
              right: 0)
        ],
      ),
    );
  }
}
