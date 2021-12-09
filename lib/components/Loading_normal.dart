import 'package:flutter/material.dart';

class NormalLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Image.asset(
          'assets/loading.gif',
          width: 300.0,
          height: 150.0,
        ));
  }
}
