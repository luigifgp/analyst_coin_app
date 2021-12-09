import 'package:analyst_coin/Redux/models/chart_model.dart';
import 'package:analyst_coin/constants.dart';
import 'package:analyst_coin/utils/app_theme.dart';
import 'package:analyst_coin/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class LineChart extends StatelessWidget {
  LineChart({@required this.lineChartData});

  final List<LineChartData> lineChartData;

  LinearGradient gradientColors = LinearGradient(
      begin: Alignment.bottomRight,
      stops: [0.1, 0.9],
      colors: [Colors.white.withOpacity(.1), kTertiaryColor.withOpacity(.6)]);
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
            lineColor: kPrimaryColor,
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
            dateFormat: DateFormat.MMMd().add_Hm(),
            labelPosition: ChartDataLabelPosition.inside,
          ),
          primaryYAxis: NumericAxis(
            axisLine: AxisLine(color: Colors.grey.withOpacity(0.1)),
            majorTickLines: MajorTickLines(color: Colors.grey.withOpacity(0.0)),
            majorGridLines: MajorGridLines(color: Colors.grey.withOpacity(0.3)),
            labelStyle: TextStyle(color: Colors.grey.withOpacity(0.6)),
            tickPosition: TickPosition.inside,
            labelPosition: ChartDataLabelPosition.inside,
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            opposedPosition: true,
          ),
          series: <ChartSeries>[
            // Renders area chart

            AreaSeries<LineChartData, dynamic>(
              borderWidth: 2,
              borderColor: Colors.white,
              dataSource: lineChartData,
              xValueMapper: (LineChartData sales, _) => (sales.time),
              yValueMapper: (LineChartData sales, _) => (sales.close),
              gradient: gradientColors,
              dataLabelSettings: DataLabelSettings(
                connectorLineSettings: ConnectorLineSettings(
                  type: ConnectorType.curve,
                ),
              ),
            ),
          ]),
    );
  }
}
