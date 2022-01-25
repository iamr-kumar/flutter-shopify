import 'package:flutter/material.dart';
import 'package:shopify/constants/Constants.dart';
import 'package:shopify/widgets/custom_input.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 100),
          width: double.infinity,
          child: Row(
            children: [
              TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                    hintText: "Search",
                  ),
                  style: Constants.regularDarkText)
            ],
          ),
        )
      ],
    );
  }
}
