import 'package:flutter/material.dart';
import 'package:shopify/widgets/custom_action_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopify/widgets/single_product.dart';

class HomeTab extends StatelessWidget {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection('Products');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<QuerySnapshot>(
            future: _productsRef.get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView(
                    padding: EdgeInsets.only(top: 100, bottom: 12),
                    children: snapshot.data.docs.map((doc) {
                      return SingleProduct(doc);
                    }).toList());
              }
              return Center(child: CircularProgressIndicator());
            }),
        CustomActionBar(
          title: "Home",
          hasBackArrow: true,
        )
      ],
    );
  }
}
