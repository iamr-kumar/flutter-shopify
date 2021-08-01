import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopify/constants/Constants.dart';
import 'package:shopify/screens/products_screen.dart';

class SingleCartItem extends StatelessWidget {
  final DocumentSnapshot doc;

  SingleCartItem(this.doc);

  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection('Products');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _productsRef.doc(doc.id).get(),
        builder: (context, prodSnap) {
          if (prodSnap.hasError) {
            return Center(child: Text("Error: ${prodSnap.error}"));
          }
          if (prodSnap.connectionState == ConnectionState.done) {
            Map<String, dynamic> product = prodSnap.data.data();
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductPage(doc.id)));
              },
              child: ListTile(
                minVerticalPadding: 18,
                horizontalTitleGap: 25,
                title: Text("${product['name']}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                leading: Image.network(product['images'][0],
                    width: 100, height: 200, fit: BoxFit.cover),
                subtitle: Text("\$${product['price']}",
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        });
  }
}
