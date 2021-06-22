import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                    "https://images.unsplash.com/photo-1601952899827-3db57e7943f7?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDV8Sjl5clBhSFhSUVl8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                    height: 250.0,
                    width: 180,
                    fit: BoxFit.cover)),
            Positioned(
                top: 10,
                right: 10,
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.favorite,
                      size: 20,
                      color: Colors.red,
                    )))
          ],
        )),
        Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Colourful Keyboard',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                Text('\$300',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18))
              ],
            ))
      ],
    );
  }
}
