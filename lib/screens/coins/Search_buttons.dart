import 'package:analyst_coin/constants.dart';
import 'package:analyst_coin/utils/app_theme.dart';
import 'package:flutter/material.dart';
//
import 'package:analyst_coin/widgets/ExchangeButtons.dart';
// redux
import 'package:analyst_coin/Redux/action_state.dart';
import 'package:analyst_coin/Redux/store.dart';

class SearchButton extends StatelessWidget {
  SearchButton(this.coinType);
  final String coinType;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 40.0, right: 40.0, left: 45.0, bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ExchangeButton(
            image: 'assets/forex_icon.png',
            coinName: "FOREX",
            colorButton: coinType == "forex" ? kTertiaryColor : Colors.white,
            onPressed: () {
              Redux.store.dispatch(fetchCoinsAction);
            },
          ),
          ExchangeButton(
            image: 'assets/crypto_icon.jpg',
            coinName: "CRYPTO",
            colorButton: coinType == "crypto" ? kTertiaryColor : Colors.white,
            onPressed: () {
              Redux.store.dispatch(fetchCoinsAction2);
            },
          ),
        ],
      ),
    );
  }
}
