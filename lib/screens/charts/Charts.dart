import 'package:analyst_coin/constants.dart';
import 'package:analyst_coin/utils/app_theme.dart';
import 'package:flutter/material.dart';
//Charts
import 'package:analyst_coin/screens/charts/CandleChart.dart';
import 'package:analyst_coin/screens/charts/LineChart.dart';
//chartScreen
import 'package:analyst_coin/screens/charts/TimeframeButton.dart';
//Redux model
import 'package:analyst_coin/Redux/models/chart_model.dart';

class ChartContainer extends StatelessWidget {
  ChartContainer(this.chartsData, this.lineChartData, this.chartTimeframe);
  final List<ChartsData> chartsData;
  final List<LineChartData> lineChartData;
  final String chartTimeframe;
  @override
  Widget build(BuildContext context) {
    return Container(
      //Initialize chart
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              TimeFrame(),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/chartscreen/completechart');
                },
                style: TextButton.styleFrom(
                  primary: kTertiaryColor,
                ),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(),
                  child: Icon(IconData(0xeaff, fontFamily: 'MaterialIcons'),
                      color: Colors.white),
                ),
              ),
            ],
          ),
          chartTimeframe != '1M'
              ? CandleChart(chartsData: chartsData)
              : LineChart(lineChartData: lineChartData),
          Row(
            children: <Widget>[
              TimeFrameButton(text: "Order Book", onPressed: () {}),
              TimeFrameButton(text: "Market Trades", onPressed: () {}),
              TimeFrameButton(text: "info", onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
