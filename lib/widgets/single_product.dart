import 'package:flutter/material.dart';
import 'package:shopify/screens/product_detail_screen.dart';

class SingleProduct extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double price;

  SingleProduct({this.id, this.title, this.imageUrl, this.price});

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    final availableHeight = size.height - padding.top;
    return Container(
      // height: availableHeight * 0.1,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProductDetails(title)));
        },
        child: Column(
          children: [
            Container(
                child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(imageUrl,
                        height: availableHeight * 0.25,
                        width: double.infinity,
                        fit: BoxFit.cover)),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            size: 20,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        )))
              ],
            )),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 5),
                    Text('\$$price',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
