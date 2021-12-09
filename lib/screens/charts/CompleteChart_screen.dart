import 'package:analyst_coin/screens/charts/CandleChart.dart';
import 'package:analyst_coin/screens/charts/LineChart.dart';
import 'package:flutter/material.dart';
import 'package:analyst_coin/constants.dart';
//ChartScreen
import 'package:analyst_coin/screens/charts/TimeframeButton.dart';
//screen width
import 'package:flutter/services.dart';
//Redux
import 'package:flutter_redux/flutter_redux.dart';
import 'package:analyst_coin/Redux/store.dart';

class CompleteChartScreen extends StatefulWidget {
  static String id = '/chartscreen/completechart';
  @override
  _CompleteChartScreenState createState() => _CompleteChartScreenState();
}

class _CompleteChartScreenState extends State<CompleteChartScreen> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
        distinct: true,
        converter: (store) => store.state.appDtState,
        builder: (context, appDtState) {
          print(appDtState.chartTimeframe);
          return SingleChildScrollView(
            child: Container(
              color: kSecondaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      TimeFrame(),
                      SizedBox(width: 390.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          primary: kTertiaryColor,
                        ),
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(),
                          child: Icon(
                              IconData(0xf11a, fontFamily: 'MaterialIcons'),
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  appDtState.chartTimeframe != '1M'
                      ? CandleChart(chartsData: appDtState.chartsData)
                      : LineChart(lineChartData: appDtState.lineChartData),
                ],
              ),
            ),
          );
        });
  }
}
