import 'package:flutter/material.dart';
import 'package:shopify/constants/Constants.dart';

class ProfileColumn extends StatelessWidget {
  final String text;

  ProfileColumn(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(text, style: Constants.regularDarkText)),
          Divider(
            color: Theme.of(context).accentColor,
            thickness: 1,
            height: 20,
          ),
        ],
      ),
    );
  }
}
