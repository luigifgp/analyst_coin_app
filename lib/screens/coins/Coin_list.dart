import 'package:analyst_coin/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:analyst_coin/constants.dart';

//additional widget
import 'package:analyst_coin/widgets/flags_container.dart';

//Redux
import 'package:analyst_coin/Redux/models/coins_model.dart';
import 'package:analyst_coin/Redux/action_state.dart';
import 'package:analyst_coin/Redux/app_state.dart';
import 'package:analyst_coin/Redux/store.dart';

List<Widget> coinList(List<Coins> coins) {
  return coins
      .map(
        (coin) => Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 25.0),
          child: GestureDetector(
            onTap: () {
              var thisCoin = CoinTaken(
                  percentage: coin.percentage,
                  name: coin.name,
                  price: coin.price,
                  shortName: coin.shortName,
                  type: coin.type);

              Redux.store.dispatch(
                  SetCoinsStateAction(AppDataState(coinTaken: thisCoin)));
            },
            child: Container(
              height: 80.0,
              decoration: BoxDecoration(
                color: kTertiaryColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: kBoxColor.withOpacity(0.22),
                    spreadRadius: 0.5,
                    blurRadius: 10,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: coin.type == 'forex'
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.stretch,
                        children: [
                          coin.type == 'forex'
                              ? FlagsContainer(coin.name.substring(0, 2),
                                  coin.name.substring(4, 6))
                              : Image.network(
                                  'https://cryptoicon-api.vercel.app/api/icon/${coin.shortName.toLowerCase()}',
                                  errorBuilder: (BuildContext context,
                                      Object exception, StackTrace stackTrace) {
                                  return Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  );
                                }),
                          SizedBox(
                            width: 5.0,
                          ),
                          coin.type == 'forex'
                              ? Text(
                                  coin.name,
                                  style: TextStyle(
                                      fontSize: 19.0,
                                      color: kBlackColor,
                                      fontWeight: FontWeight.w500),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      coin.name,
                                      style: TextStyle(
                                          fontSize: 19.0,
                                          color: kBlackColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      coin.shortName,
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.grey),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          coin.type == 'forex'
                              ? coin.price
                              : r'$' +
                                  '${double.parse(coin.price).toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 17.0,
                              color: kBlackColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          coin.type == 'forex'
                              ? coin.percentage
                              : '%${double.parse(coin.percentage).toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: coin.type == 'forex'
                                  ? coin.percentage.substring(0, 1) == '-'
                                      ? kPriceDownColor
                                      : kPriceUpColor
                                  : double.parse(coin.percentage) < 0
                                      ? kPriceDownColor
                                      : kPriceUpColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
      .toList();
}
