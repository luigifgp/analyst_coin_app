// redux
import 'package:analyst_coin/Redux/action_state.dart';
import 'package:analyst_coin/Redux/app_state.dart';
import 'package:analyst_coin/Redux/models/chart_model.dart';
import 'package:analyst_coin/Redux/store.dart';
//networking
import 'package:analyst_coin/services/networking.dart';
//others
import 'dart:async';
import 'dart:convert';

//
// class StreamChart {
//   Timer timerObj;
//   Timer timerObjVar;
//
//   /// if the chart timeframe is 1 minute will do...
//   final StreamController<int> _streamController = StreamController<int>();
//   Stream<int> get streamController => _streamController.stream;
//
//
//   void
//
//   }
//
//   Future<void> streamChart(coin, timeframe) async {
//     print('hello world');
//     try {
//       NetworkHelper networkHelper = NetworkHelper(Uri.parse(
//           'https://dev-api.shrimpy.io/v1/exchanges/binance/candles?quoteTradingSymbol=USDT&baseTradingSymbol=$coin&interval=$timeframe'));
//       var dataCoin = await networkHelper.getData();
//
//       final List<dynamic> data = await json.decode(dataCoin);
//
//       if (NetworkHelper.statusCode == 200)
//         Redux.store.dispatch(
//           SetCoinsStateAction(
//             AppDataState(
//               chartsData: ChartsData.chartListFromJson(data),
//               lineChartData: LineChartData.lineChartListFromJson(data),
//             ),
//           ),
//         );
//     } catch (e) {
//       print(e);
//     }
//   }
// }
