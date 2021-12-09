import 'package:flutter/material.dart';

class LoadingWithoutBG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.asset(
      'assets/loading.gif',
      width: 300.0,
      height: 150.0,
    ));
  }
}
