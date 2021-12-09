import 'package:analyst_coin/constants.dart';
import 'package:analyst_coin/utils/app_theme.dart';
import 'package:flutter/material.dart';
//component
import 'package:analyst_coin/components/Button.dart';
//redux
import 'package:analyst_coin/Redux/action_state.dart';
import 'package:analyst_coin/Redux/app_state.dart';
import 'package:analyst_coin/Redux/store.dart';

class PriceAlarm extends StatefulWidget {
  PriceAlarm({this.coinShortName, this.coinName, this.dialogContext});
  final String coinShortName;
  final String coinName;

  final BuildContext dialogContext;
  @override
  _PriceAlarmState createState() => _PriceAlarmState();
}

class _PriceAlarmState extends State<PriceAlarm> {
  String priceSet;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 300.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.coinName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
                    color: kBlackColor,
                  ),
                ),
                kSpace,

                TextField(
                  autofocus: false,
                  style: TextStyle(color: kBlackColor),
                  readOnly: true,
                  decoration: kInputStylePrimary.copyWith(
                      labelText: widget.coinShortName),
                ),
                kSpace,
                TextField(
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: kBlackColor),
                  onChanged: (value) {
                    setState(() {
                      priceSet = value;
                    });
                  },
                  decoration: kInputStylePrimary.copyWith(labelText: 'Price'),
                ),
                kSpace,
                Button(
                    btnColor: kPrimaryColor,
                    btnTitle: 'Set alarm',
                    onPressed: () {
                      Navigator.pop(widget.dialogContext);

                      Redux.store.dispatch(SetCoinsStateAction(
                          AppDataState(priceAlarm: double.parse(priceSet))));
                    })
                //password verification
              ],
            ),
          ),
        ),
      ),
    );
  }
}
