import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String title;

  ProductDetails(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //white your color here
          ),
          title: Text(title, style: TextStyle(color: Colors.white)),
        ),
        body: Center(child: Text('Details Screen')));
  }
}
