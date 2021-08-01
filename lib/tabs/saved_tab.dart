import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopify/screens/products_screen.dart';
import 'package:shopify/widgets/custom_action_bar.dart';
import 'package:shopify/widgets/single_product.dart';

class SavedTab extends StatelessWidget {
  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection('Users');

  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection('Products');

  final User _user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<QuerySnapshot>(
            future: _usersRef.doc(_user.uid).collection('Saved').get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView(
                    padding: EdgeInsets.only(top: 120, bottom: 12),
                    children: snapshot.data.docs.map((doc) {
                      return FutureBuilder(
                          future: _productsRef.doc(doc.id).get(),
                          builder: (context, prodSnap) {
                            if (prodSnap.hasError) {
                              return Center(
                                  child: Text("Error: ${prodSnap.error}"));
                            }
                            if (prodSnap.connectionState ==
                                ConnectionState.done) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductPage(doc.id)));
                                  },
                                  child: SingleProduct(prodSnap.data));
                            }

                            return Center(child: CircularProgressIndicator());
                          });
                    }).toList());
              }
              return Center(child: CircularProgressIndicator());
            }),
        CustomActionBar(title: "Save Products")
      ],
    );
  }
}
