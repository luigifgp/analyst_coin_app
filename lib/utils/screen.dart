import 'package:flutter/material.dart';

class Screen {
  dynamic context;

  Screen(this.context);

  double wp(percentage) {
    return percentage / 100 * MediaQuery.of(context).size.width;
  }

  double hp(percentage) {
    return percentage / 100 * MediaQuery.of(context).size.height;
  }
}
