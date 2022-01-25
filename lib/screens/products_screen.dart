import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopify/constants/Constants.dart';
import 'package:shopify/widgets/custom_action_bar.dart';
import 'package:shopify/widgets/image_view.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final String productId;

  ProductPage(this.productId);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection('Products');

  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection('Users');

  User _user = FirebaseAuth.instance.currentUser;

  Future _addToCart() {
    return _usersRef
        .doc(_user.uid)
        .collection('Cart')
        .doc(widget.productId)
        .set({
      'productId': widget.productId,
    });
  }

  Future _saveProduct() {
    return _usersRef
        .doc(_user.uid)
        .collection("Saved")
        .doc(widget.productId)
        .set({"productId": widget.productId});
  }

  SnackBar _getSnackbar(String text) {
    return SnackBar(content: Text(text));
  }

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
                            style: TextStyle(fontSize: 16.0))),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 52, horizontal: 24),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await _saveProduct();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    _getSnackbar("Product saved"));
                              },
                              child: Container(
                                  width: 65.0,
                                  height: 65.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFDCDCDC),
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  alignment: Alignment.center,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/tab_saved.png"),
                                    height: 30.0,
                                  )),
                            ),
                            Expanded(
                                child: GestureDetector(
                              onTap: () async {
                                await _addToCart();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    _getSnackbar("Product added to cart"));
                              },
                              child: Container(
                                  height: 65.0,
                                  margin: EdgeInsets.only(left: 16.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  child: Text("Add To Cart",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600))),
                            ))
                          ],
                        ))
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
