import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopify/constants/Constants.dart';
import 'package:shopify/widgets/custom_action_bar.dart';
import 'package:shopify/widgets/image_view.dart';

class ProductPage extends StatefulWidget {
  final String productId;

  ProductPage(this.productId);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection('Products');

  int _selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FutureBuilder(
            future: _productsRef.doc(widget.productId).get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> product = snapshot.data.data();

                List imageList = product['images'];

                return ListView(
                  children: [
                    Container(height: 400, child: ImageView(imageList)),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24,
                        bottom: 4,
                        left: 24,
                        right: 24,
                      ),
                      child: Text("${product['name']}",
                          style: Constants.boldHeading),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 24.0),
                        child: Text("\$${product['price']}",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w600))),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                        child: Text("${product['desc']}",
                            style: TextStyle(fontSize: 16.0)))
                  ],
                );
              }

              return Center(child: CircularProgressIndicator());
            }),
        CustomActionBar(
          hasTitle: false,
          hasBackArrow: true,
          hasBackground: false,
          hasBlackColor: true,
        )
      ]),
    );
  }
}
