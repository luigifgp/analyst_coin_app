import 'package:analyst_coin/constants.dart';
import 'package:analyst_coin/utils/app_theme.dart';
import 'package:analyst_coin/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//syncfusion
import 'package:syncfusion_flutter_charts/charts.dart';
//redux
import 'package:analyst_coin/Redux/models/chart_model.dart';

class CandleChart extends StatelessWidget {
  const CandleChart({
    @required this.chartsData,
  });

  final List<ChartsData> chartsData;

  @override
  Widget build(BuildContext context) {
    //size screen
    final Function wd = Screen(context).wp;
    final Function hg = Screen(context).hp;

    return Container(
      height: hg(53),
      child: SfCartesianChart(
          margin: EdgeInsets.only(right: 0.0, left: 0.0),
          plotAreaBackgroundColor: kPrimaryColor,
          crosshairBehavior: CrosshairBehavior(
            enable: true,
            lineColor: Colors.white,
            activationMode: ActivationMode.longPress,
          ),
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
            enablePinching: true,
          ),
          plotAreaBorderColor: Colors.grey.withOpacity(0.3),
          backgroundColor: kPrimaryColor,
          borderColor: Colors.grey.withOpacity(0.3),
          primaryXAxis: DateTimeAxis(
            axisLine: AxisLine(color: Colors.grey.withOpacity(0.5)),
            majorTickLines: MajorTickLines(color: Colors.grey.withOpacity(0.1)),
            tickPosition: TickPosition.inside,
            majorGridLines: MajorGridLines(color: Colors.grey.withOpacity(0.3)),
            labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
            dateFormat: DateFormat.yMMMd().add_Hm(),
            zoomPosition: 0.1,
            zoomFactor: 0.5,
            labelPosition: ChartDataLabelPosition.inside,
          ),
          primaryYAxis: NumericAxis(
              axisLine: AxisLine(color: Colors.grey.withOpacity(0.1)),
              majorTickLines:
                  MajorTickLines(color: Colors.grey.withOpacity(0.0)),
              majorGridLines:
                  MajorGridLines(color: Colors.grey.withOpacity(0.3)),
              labelStyle: TextStyle(color: kBlackColor.withOpacity(0.6)),
              tickPosition: TickPosition.inside,
              labelPosition: ChartDataLabelPosition.inside,
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              opposedPosition: true,
              zoomPosition: 0.6,
              zoomFactor: 0.2),
          series: <ChartSeries>[
            // Renders CandleSeries

            CandleSeries<ChartsData, dynamic>(
              dataSource: chartsData,
              xValueMapper: (ChartsData sales, _) => sales.time,
              lowValueMapper: (ChartsData sales, _) => sales.low,
              highValueMapper: (ChartsData sales, _) => sales.high,
              openValueMapper: (ChartsData sales, _) => sales.open,
              closeValueMapper: (ChartsData sales, _) => sales.close,
            )
          ]),
    );
  }
}
