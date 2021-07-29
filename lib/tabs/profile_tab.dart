import 'package:flutter/material.dart';
import 'package:shopify/widgets/custom_action_bar.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text('Profile Tab'),
        ),
        CustomActionBar(
          title: "My Profile",
          hasBackArrow: true,
        )
      ],
    );
  }
}
