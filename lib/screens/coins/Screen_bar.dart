import 'package:analyst_coin/constants.dart';
import 'package:flutter/material.dart';
import 'package:analyst_coin/utils/app_theme.dart';

//
import 'package:analyst_coin/screens/Profile_button/Option_user_button.dart';

class ScreenBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function onTap;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 8.0, left: 3.0, right: 3.0),
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: kSecondaryColor),
              boxShadow: [
                BoxShadow(
                  color: kBoxColor.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  OptionsUserButton(onTap),
                  SizedBox(
                    width: 5.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: kSecondaryColor),
              boxShadow: [
                BoxShadow(
                  color: kBoxColor.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                IconData(58144, fontFamily: 'MaterialIcons'),
                size: 35.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
