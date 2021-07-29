import 'package:flutter/material.dart';
import 'package:shopify/widgets/custom_action_bar.dart';

class SavedTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text('Saved Tab'),
        ),
        CustomActionBar(title: "Save Products")
      ],
    );
  }
}
