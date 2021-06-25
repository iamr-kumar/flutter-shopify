import 'package:flutter/material.dart';
import 'package:shopify/constants/Constants.dart';
import 'package:shopify/widgets/custom_button.dart';
import 'package:shopify/widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              child: Text('Welcome, \nLogin to your account',
                  textAlign: TextAlign.center, style: Constants.boldHeading),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CustomInput(customHintText: 'Email'),
                  CustomInput(customHintText: 'Password'),
                  SizedBox(height: 12),
                  CustomButton(onPressed: () {}, text: 'Login')
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(24.0),
                child: CustomButton(
                    text: 'Create New Account',
                    isOutlined: true,
                    onPressed: () {})),
          ],
        ),
      ),
    ));
  }
}
