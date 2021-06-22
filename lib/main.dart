import 'package:flutter/material.dart';
import 'package:shopify/screens/products_screen.dart';

void main() {
  runApp(MyApp());
}

const MaterialColor customColor =
    const MaterialColor(0xFFFF7465, const <int, Color>{
  50: const Color.fromRGBO(255, 116, 101, .1),
  100: const Color.fromRGBO(255, 116, 101, .2),
  200: const Color.fromRGBO(255, 116, 101, .3),
  300: const Color.fromRGBO(255, 116, 101, .4),
  400: const Color.fromRGBO(255, 116, 101, .5),
  500: const Color.fromRGBO(255, 116, 101, .6),
  600: const Color.fromRGBO(255, 116, 101, .7),
  700: const Color.fromRGBO(255, 116, 101, .8),
  800: const Color.fromRGBO(255, 116, 101, .9),
  900: const Color.fromRGBO(255, 116, 101, 1),
});

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: customColor,
          canvasColor: Colors.white,
          accentColor: Color.fromRGBO(247, 248, 251, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(190, 191, 192, 1)))),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ProductsScreen();
  }
}