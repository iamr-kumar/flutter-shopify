import 'package:flutter/material.dart';
import 'package:shopify/constants/Constants.dart';

class CustomInput extends StatelessWidget {
  final String customHintText;

  CustomInput({this.customHintText});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(12)),
        child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              hintText: customHintText,
            ),
            style: Constants.regularDarkText));
  }
}
