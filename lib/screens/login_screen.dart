import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopify/constants/Constants.dart';
import 'package:shopify/screens/signup_screen.dart';
import 'package:shopify/widgets/custom_button.dart';
import 'package:shopify/widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _loginFormLoading = false;
  String _loginEmail = "";
  String _loginPassword = "";
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<String> _loginUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _loginEmail, password: _loginPassword);
      print(userCredential);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return 'Invalid email or password';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(error),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'))
            ],
          );
        });
  }

  void _submitForm() async {
    setState(() {
      _loginFormLoading = true;
    });
    String result = await _loginUser();
    setState(() {
      _loginFormLoading = false;
    });
    if (result != null) {
      _alertDialogBuilder(result);
    }
  }

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
                  CustomInput(
                    customHintText: 'Email',
                    onChanged: (value) {
                      _loginEmail = value;
                    },
                    onSubmitted: (value) {
                      _passwordFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  CustomInput(
                    customHintText: 'Password',
                    onChanged: (value) {
                      _loginPassword = value;
                    },
                    onSubmitted: (value) {
                      _submitForm();
                    },
                    focusNode: _passwordFocusNode,
                    isPassword: true,
                  ),
                  SizedBox(height: 12),
                  CustomButton(
                      onPressed: () {
                        _submitForm();
                      },
                      isLoading: _loginFormLoading,
                      text: 'Login')
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(24.0),
                child: CustomButton(
                    text: 'Create New Account',
                    isOutlined: true,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    })),
          ],
        ),
      ),
    ));
  }
}
