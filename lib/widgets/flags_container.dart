import 'package:flutter/material.dart';

class FlagsContainer extends StatelessWidget {
  FlagsContainer(this.firstFlag, this.secondFlag);

  final String firstFlag;
  final String secondFlag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                'https://flagcdn.com/32x24/${firstFlag.toLowerCase()}.png',
                width: 20.0, errorBuilder: (BuildContext context,
                    Object exception, StackTrace stackTrace) {
              return Icon(
                Icons.error,
                color: Colors.red,
              );
            }),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Image.network(
                  'https://flagcdn.com/32x24/${secondFlag.toLowerCase()}.png',
                  width: 20.0, errorBuilder: (BuildContext context,
                      Object exception, StackTrace stackTrace) {
                return Icon(
                  Icons.error,
                  color: Colors.red,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
