import 'package:flutter/material.dart';
import 'package:shopify/constants/Constants.dart';

class CustomInput extends StatelessWidget {
  final String customHintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final bool isPassword;
  final TextInputAction textInputAction;

  CustomInput(
      {this.customHintText,
      this.onChanged,
      this.onSubmitted,
      this.focusNode,
      this.isPassword,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    bool _isPassword = isPassword ?? false;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(12)),
        child: TextField(
            onChanged: onChanged,
            obscureText: _isPassword,
            textInputAction: textInputAction,
            focusNode: focusNode,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              hintText: customHintText,
            ),
            style: Constants.regularDarkText));
  }
}
