/// network
import 'dart:async';

import 'package:analyst_coin/services/networking.dart';
//redux
import 'package:analyst_coin/Redux/store.dart';
import 'package:redux/redux.dart';
// appState
import 'app_state.dart';
//Models
import 'package:analyst_coin/Redux/models/chart_model.dart';
import 'package:analyst_coin/Redux/models/coins_model.dart';
//others
import 'package:meta/meta.dart';
import 'dart:convert';

/// CRYPTO API
const String cryptoUrl = 'https://api.coincap.io/v2/assets';

///FOREX API
const String apiKey = "aoZGsWZxMFb4nsJ7XUqX7N";
String forexUrl =
    "https://fcsapi.com/api-v3/forex/latest?symbol=$forex&access_key=$apiKey";

@immutable
class SetCoinsStateAction {
  SetCoinsStateAction(this.appDtState);

  final AppDataState appDtState;
}

/// forex api call

Future<void> fetchCoinsAction(Store<AppState> store) async {
  store.dispatch(SetCoinsStateAction(AppDataState(isLoading: true)));
  try {
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(forexUrl));
    var dataCoin = await networkHelper.getData();

    final List<dynamic> data = await json.decode(dataCoin)['response'];

    if (NetworkHelper.statusCode == 200)
      store.dispatch(
        SetCoinsStateAction(
          AppDataState(
            isLoading: false,
            coins: Coins.forexListFromJson(data),
          ),
        ),
      );
  } catch (error) {
    store.dispatch(SetCoinsStateAction(AppDataState(isLoading: false)));
  }
}

/// crypto api call

Future<void> fetchCoinsAction2(Store<AppState> store) async {
  store.dispatch(SetCoinsStateAction(AppDataState(isLoading: true)));

  try {
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(cryptoUrl));
    var dataCoin = await networkHelper.getData();

    final List<dynamic> data = await json.decode(dataCoin)['data'];

    if (NetworkHelper.statusCode == 200)
      store.dispatch(
        SetCoinsStateAction(
          AppDataState(
            isLoading: false,
            coins: Coins.cryptoListFromJson(data),
          ),
        ),
      );
  } catch (error) {
    store.dispatch(SetCoinsStateAction(AppDataState(isLoading: false)));
  }
}

// take index coin and display it

void takeIndexCoin(Store<AppState> store, index) {
  store.dispatch(SetCoinsStateAction(AppDataState(coinTaken: index)));
}

// get userTaken
void getCurrentUser(Store<AppState> store, token) {
  store.dispatch(SetCoinsStateAction(AppDataState(currentUser: token)));
}

// get chart data

Future<void> chartAction(Store<AppState> store, timeframe, coin) async {
  store.dispatch(SetCoinsStateAction(AppDataState(isLoading: true)));
  //
  try {
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(
        'https://dev-api.shrimpy.io/v1/exchanges/binance/candles?quoteTradingSymbol=USDT&baseTradingSymbol=$coin&interval=$timeframe'));
    var dataCoin = await networkHelper.getData();

    final List<dynamic> data = await json.decode(dataCoin);

    if (NetworkHelper.statusCode == 200)
      store.dispatch(
        SetCoinsStateAction(
          AppDataState(
            isLoading: false,
            chartsData: ChartsData.chartListFromJson(data),
            lineChartData: LineChartData.lineChartListFromJson(data),
            chartTimeframe: timeframe,
          ),
        ),
      );
  } catch (e) {
    store.dispatch(SetCoinsStateAction(AppDataState(isLoading: false)));
  }
}

String forex =
    "EUR/USD,USD/JPY,GBP/CHF,GBP/USD,USD/CAD,AUD/USD,EUR/GBP,EUR/CHF,USD/CAD,USD/CHF,XAU/USD,GBP/JPY,GBP/USD,NZD/USD,USD/MXN,EUR/MXN,";
