import 'package:flutter/material.dart';

const kSpace = SizedBox(
  height: 30.0,
);

const kPrimaryColor = Color(0xFF321A47);
const kSecondaryColor = Color(0xFF3c1f55);
const kTertiaryColor = Color(0xFFeae8ec);
const kBoxColor = Color(0xFF0f0715);

const kWhiteColor = Color(0xFFE7F0F2);
const kBlackColor = Color(0XFF0b032d);

const kPriceDownColor = Color(0xFFD11101);
const kPriceUpColor = Color(0xFF348001);

const kInputStyleWhite = InputDecoration(
  labelText: '',
  labelStyle: TextStyle(color: Colors.grey, fontSize: 18.0),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(22.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(22.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(22.0)),
  ),
);

const kInputStylePrimary = InputDecoration(
  labelText: '',
  labelStyle: TextStyle(color: Colors.grey, fontSize: 18.0),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(22.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(22.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(22.0)),
  ),
);

const kStylePrice =
    TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w600);
