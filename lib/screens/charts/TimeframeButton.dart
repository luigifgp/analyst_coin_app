import 'package:analyst_coin/constants.dart';
import 'package:analyst_coin/utils/app_theme.dart';
import 'package:flutter/material.dart';

//Redux
import 'package:analyst_coin/Redux/store.dart';
import 'package:analyst_coin/Redux/action_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TimeFrameButton extends StatelessWidget {
  const TimeFrameButton({this.text, this.onPressed, this.color});
  final Function onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color,
        primary: kTertiaryColor,
      ),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class TimeFrame extends StatelessWidget {
  final List<Map<String, dynamic>> _map = [
    {"text": "Line", "chartTimeFrame": '1M'},
    {"text": "1D", "chartTimeFrame": "1D"},
    {"text": "6h", "chartTimeFrame": "6H"},
    {"text": "1h", "chartTimeFrame": "1H"},
    {"text": "15m", "chartTimeFrame": "15M"},
  ];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
        distinct: true,
        converter: (store) => store.state.appDtState,
        builder: (context, appDtState) {
          return Row(
              children: _map.map((Map<String, dynamic> data) {
            return TimeFrameButton(
                color: appDtState.chartTimeframe != data['chartTimeFrame']
                    ? kPrimaryColor
                    : kBlackColor.withOpacity(0.3),
                text: data['text'],
                onPressed: () {
                  Redux.store.dispatch(chartAction(Redux.store,
                      data['chartTimeFrame'], appDtState.coinTaken.shortName));
                });
          }).toList());
        });
  }
}

//  TimeFrameButton(
//                 color: appDtState.chartTimeframe != '1D'
//                     ? kSecondaryColor
//                     : kTertiaryColor.withOpacity(0.1),
//                 text: '1D',
//                 onPressed: () {
//                   Redux.store.dispatch(chartAction(
//                       Redux.store, '1D', appDtState.coinTaken.shortName));
//                 }),
//             TimeFrameButton(
//                 color: appDtState.chartTimeframe != '6H'
//                     ? kSecondaryColor
//                     : kTertiaryColor.withOpacity(0.1),
//                 text: '6h',
//                 onPressed: () {
//                   Redux.store.dispatch(chartAction(
//                       Redux.store, '6H', appDtState.coinTaken.shortName));
//                 }),
//             TimeFrameButton(
//                 color: appDtState.chartTimeframe != '1H'
//                     ? kSecondaryColor
//                     : kTertiaryColor.withOpacity(0.1),
//                 text: '1h',
//                 onPressed: () {
//                   Redux.store.dispatch(chartAction(
//                       Redux.store, '1H', appDtState.coinTaken.shortName));
//                 }),
//             TimeFrameButton(
//                 color: appDtState.chartTimeframe != '15M'
//                     ? kSecondaryColor
//                     : kTertiaryColor.withOpacity(0.1),
//                 text: '15m',
//                 onPressed: () {
//                   Redux.store.dispatch(chartAction(
//                       Redux.store, '15M', appDtState.coinTaken.shortName));
//                 }),
