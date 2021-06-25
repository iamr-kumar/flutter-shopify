import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopify/screens/signup_screen.dart';

import './home_screen.dart';
import './login_screen.dart';

class LandingScreen extends StatelessWidget {
  // initialize firebase in the app
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text("Error ${snapshot.error}")));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamSnapshot) {
                if (streamSnapshot.hasError) {
                  return Scaffold(
                      body:
                          Center(child: Text("Error ${streamSnapshot.error}")));
                }

                // Auth state retreievd. Proceed further based on user details
                if (streamSnapshot.connectionState == ConnectionState.active) {
                  User _user = streamSnapshot.data;

                  if (_user != null) {
                    return HomeScreen();
                  } else {
                    return SignupScreen();
                  }
                }

                // Checking the auth state
                return Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              });
        }

        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
