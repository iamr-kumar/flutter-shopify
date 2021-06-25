import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isOutlined;

  CustomButton({this.text, this.onPressed, this.isOutlined});

  @override
  Widget build(BuildContext context) {
    bool _outlinedButton = isOutlined ?? false;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: _outlinedButton ? Colors.transparent : Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          onPrimary: _outlinedButton ? Colors.black : null,
          elevation: 0,
          minimumSize: Size(double.infinity, 60),
          side: _outlinedButton
              ? BorderSide(color: Colors.black, width: 2.0)
              : null,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      child: Text(text ?? "Text",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
    );
  }
}
