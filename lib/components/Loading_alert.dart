import 'package:flutter/material.dart';

class ModalLoading extends StatefulWidget {
  @override
  _ModalLoadingState createState() => _ModalLoadingState();
}

class _ModalLoadingState extends State<ModalLoading> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.all(35.0),
        scrollable: false,
        content: Container(
            child: Image.asset(
          'assets/loading.gif',
        )));
  }
}
