import 'package:analyst_coin/constants.dart';
import 'package:analyst_coin/utils/app_theme.dart';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({this.btnColor, this.btnTitle, this.onPressed});

  final String btnTitle;
  final Color btnColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.0),
      child: FlatButton(
        onPressed: onPressed,
        padding: EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.white),
        ),
        child: Text(
          btnTitle,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: btnColor == kPrimaryColor ? Colors.white : Colors.black),
        ),
        color: btnColor,
      ),
    );
  }
}
