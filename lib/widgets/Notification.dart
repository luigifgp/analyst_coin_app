import 'package:flutter/material.dart';

class AppNotification extends StatelessWidget {
  AppNotification({@required this.payload});

  String payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(payload),
      ),
    );
  }
}
