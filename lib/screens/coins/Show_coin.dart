import 'package:analyst_coin/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:analyst_coin/constants.dart';
//
import 'package:analyst_coin/screens/coins/price_alarm.dart';
import 'package:analyst_coin/widgets/CoinMethodButton.dart';
import 'package:intl/intl.dart';
// Redux
import 'package:analyst_coin/Redux/models/coins_model.dart';

class ShowCoin extends StatelessWidget {
  ShowCoin({this.coinTaken});

  final CoinTaken coinTaken;

  @override
  Widget build(BuildContext context) {
    //redux data
    final percentage = coinTaken.percentage.substring(0, 1) == '-';
    final price = double.parse(coinTaken.price).toStringAsFixed(3);
    return Container(
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 15.0, right: 15.0, bottom: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  coinTaken.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, color: Colors.grey[400]),
                ),
                SizedBox(
                  width: coinTaken.type != 'crypto' ? 25.0 : 40.0,
                ),
                Text(
                  coinTaken.type != 'crypto'
                      ? coinTaken.percentage
                      : '${double.parse(coinTaken.percentage).toStringAsFixed(2)}%',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                      color: percentage ? kPriceDownColor : kPriceUpColor),
                ),
                Transform.rotate(
                  angle: percentage ? 120 * 40 / 180 : 180 * 55 / 180,
                  child: Icon(
                    IconData(
                      0xe5af,
                      fontFamily: 'MaterialIcons',
                    ),
                    color: percentage ? kPriceDownColor : kPriceUpColor,
                    size: 23.0,
                  ),
                )
              ],
            ),
          ),
          coinTaken.type != 'crypto'
              ? Text('')
              : Text(
                  coinTaken.shortName,
                  style: TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
          SizedBox(
            height: 12.0,
          ),
          Text(coinTaken.type != 'crypto' ? coinTaken.price : r'$' + '$price',
              style: kStylePrice),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CoinMethodButton(
                icon: IconData(0xe5c6, fontFamily: 'MaterialIcons'),
                title: "Buy",
                onPressed: () {
                  var date = DateTime.fromMicrosecondsSinceEpoch(1586348737122);
                  print(DateFormat.yMMMd().format(date));
                },
              ),
              CoinMethodButton(
                icon: IconData(0xe807, fontFamily: 'MaterialIcons'),
                title: "Graphic",
                onPressed: () {
                  Navigator.pushNamed(context, '/chartscreen',
                      arguments: coinTaken);
                },
              ),
              CoinMethodButton(
                icon: IconData(0xe006, fontFamily: 'MaterialIcons'),
                title: "Alarm",
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return PriceAlarm(
                            coinShortName: coinTaken.shortName,
                            coinName: coinTaken.name,
                            dialogContext: context);
                      });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
