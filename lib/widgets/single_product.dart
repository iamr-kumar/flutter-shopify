import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopify/constants/Constants.dart';
import 'package:shopify/screens/products_screen.dart';

class SingleProduct extends StatelessWidget {
  final DocumentSnapshot doc;

  SingleProduct(this.doc);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(doc.id)));
      },
      child: Container(
          height: 300.0,
          margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 24.0),
          child: Stack(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    "${doc.data()['images'][0]}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(doc.data()['name'], style: Constants.regularHeading),
                      Text("\$${doc.data()['price']}",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
