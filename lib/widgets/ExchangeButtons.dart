import 'package:analyst_coin/constants.dart';
import 'package:analyst_coin/utils/app_theme.dart';
import 'package:flutter/material.dart';

class ExchangeButton extends StatelessWidget {
  const ExchangeButton(
      {this.image, this.coinName, this.onPressed, this.colorButton});

  final String image;
  final String coinName;
  final Function onPressed;
  final Color colorButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(13.0),
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: Offset(-2, 4), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image.asset(
              image,
              width: 40.0,
            ),
            SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  coinName,
                  style: TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0),
                ),
                Text(
                  'exchanges',
                  style: TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
