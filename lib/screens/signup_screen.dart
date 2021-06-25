import 'package:flutter/material.dart';
import 'package:shopify/constants/Constants.dart';
import 'package:shopify/widgets/custom_button.dart';
import 'package:shopify/widgets/custom_input.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text('Welcome! \nCreate a new account',
                  textAlign: TextAlign.center, style: Constants.boldHeading),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CustomInput(customHintText: 'Email'),
                  CustomInput(customHintText: 'Password'),
                  SizedBox(height: 12),
                  CustomButton(onPressed: () {}, text: 'Signup')
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(24.0),
                child: CustomButton(
                    text: 'Login', isOutlined: true, onPressed: () {})),
          ],
        ),
      ),
    ));
  }
}
