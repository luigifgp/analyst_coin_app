import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({this.textColor, this.onTap, this.decoration, this.type});
  final Color textColor;
  final Function onTap;
  final dynamic decoration;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      keyboardType: type,
      style: TextStyle(color: textColor),
      onChanged: onTap,
      decoration: decoration,
    );
  }
}
