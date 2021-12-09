import 'package:analyst_coin/constants.dart';
import 'package:analyst_coin/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoinMethodButton extends StatelessWidget {
  const CoinMethodButton({this.icon, this.title, this.onPressed});

  final IconData icon;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0, left: 15.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: [
                  BoxShadow(
                    color: kBoxColor.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 29.0,
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
