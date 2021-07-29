import 'package:flutter/material.dart';
import 'package:shopify/widgets/custom_action_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                return Center(child: Text('Done'));
              }
              return Center(child: CircularProgressIndicator());
            }),
        CustomActionBar(title: "Home")
      ],
    );
  }
}
