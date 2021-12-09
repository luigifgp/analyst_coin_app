import 'package:analyst_coin/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:analyst_coin/constants.dart';
//screen
import 'package:analyst_coin/utils/screen.dart';
//loading
import 'package:analyst_coin/components/Loading_without_bg.dart';
//chart
import 'package:analyst_coin/screens/charts/Charts.dart';
//Redux
import 'package:flutter_redux/flutter_redux.dart';
import 'package:analyst_coin/Redux/action_state.dart';
import 'package:analyst_coin/Redux/models/coins_model.dart';
import 'package:analyst_coin/Redux/store.dart';
//
import 'package:analyst_coin/screens/charts/StreamChart.dart';
import 'package:analyst_coin/services/alarm_notification.dart';

class ChartScreen extends StatefulWidget {
  static String id = '/chartscreen';
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  double totalUsdVolume = 1;
  double percentage;
  double gainOrLoss = 0;
  double btcVolume = 0;
  String defaultTimeframe = '1H';
  bool cancel;

  @override
  Widget build(BuildContext context) {
    //size screen
    final Function wd = Screen(context).wp;
    final Function hg = Screen(context).hp;

    // Navigator data
    final CoinTaken foreignData = ModalRoute.of(context).settings.arguments;

    /// Api Call Data Chart
    Redux.store.dispatch(
        chartAction(Redux.store, defaultTimeframe, foreignData.shortName));
    //
    percentage = double.parse(foreignData.percentage);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              foreignData.name,
              textAlign: TextAlign.center,
            ),
            Icon(
              IconData(0xea23, fontFamily: 'MaterialIcons'),
              size: 30.0,
            ),
            //Icon(IconData(0xea22, fontFamily: 'MaterialIcons')),
          ],
        ),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          StoreConnector<AppState, dynamic>(
              distinct: true,
              converter: (store) => store.state.appDtState,
              builder: (context, appDtState) {
                if (appDtState.isLoading)
                  return Expanded(
                    child: Container(
                        height: hg(100),
                        width: wd(100),
                        color: Colors.black.withOpacity(0.4),
                        child: LoadingWithoutBG()),
                  );
                else
                  totalUsdVolume = appDtState.chartsData.last.btcVolume *
                      appDtState.chartsData.last.close;
                btcVolume = appDtState.chartsData.last.btcVolume;

                // stream chart
                // StreamChart streamChart = new StreamChart();

                // appDtState.chartTimeframe == '1M'
                //     ? streamChart.stream(appDtState.coinTaken.shortName,
                //         appDtState.chartTimeframe)
                //     : streamChart.cancelStream();

                //alarm price
                CoinAlarm coinAlarm = CoinAlarm(
                    priceC: appDtState.chartsData.last.close,
                    priceH: appDtState.chartsData.last.high,
                    priceL: appDtState.chartsData.last.low,
                    priceSet: appDtState.priceAlarm);

                coinAlarm.notificationActive();

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: hg(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                    '\$' +
                                        appDtState.chartsData.last.close
                                            .toStringAsFixed(2),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      'Vol(BTC)   ${btcVolume.toStringAsFixed(2)}',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      ' ${percentage < 0 ? "" : "+"} ${percentage.toStringAsFixed(2)}%',
                                      style: TextStyle(
                                          color: percentage < 0
                                              ? kPriceDownColor
                                              : kPriceUpColor,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 20.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 15.0),
                                Container(
                                  height: 80.0,
                                  width: 150.0,
                                  decoration: BoxDecoration(
                                    color: kSecondaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: kBlackColor.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(
                                            0, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "volume.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                          '\$${totalUsdVolume.toStringAsFixed(2)}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      ChartContainer(appDtState.chartsData,
                          appDtState.lineChartData, appDtState.chartTimeframe),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
