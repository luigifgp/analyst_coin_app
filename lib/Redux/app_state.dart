import 'package:analyst_coin/Redux/models/chart_model.dart';
import 'package:analyst_coin/Redux/models/coins_model.dart';
import 'package:meta/meta.dart';

@immutable
class AppDataState {
  //appTheme
  final bool appTheme;
  //coins
  final bool isError;
  final bool isLoading;
  final List<Coins> coins;
  final CoinTaken coinTaken;
  //users
  final String currentUser;
  //charts
  final someDataCoin;
  final List<ChartsData> chartsData;
  final String chartTimeframe;
  final List<LineChartData> lineChartData;
  //alarm
  final double priceAlarm;

  AppDataState({
    this.appTheme,
    this.isError,
    this.isLoading,
    this.coins,
    this.coinTaken,
    this.currentUser,
    this.chartsData,
    this.chartTimeframe,
    this.someDataCoin,
    this.lineChartData,
    this.priceAlarm,
  });

  factory AppDataState.initial() => AppDataState(
        isLoading: false,
        isError: false,
        coins: const [],
        coinTaken: null,
        currentUser: '',
        chartsData: [],
        chartTimeframe: '1h',
        lineChartData: [],
        priceAlarm: 0,
        appTheme: false,
      );

  AppDataState copyWith({
    //AppTheme
    bool appTheme,
    //coin
    @required bool isError,
    @required bool isLoading,
    @required List<Coins> coins,
    CoinTaken coinTaken,
    //user
    @required String currentUser,
    // charts
    List<ChartsData> chartsData,
    String chartTimeframe,
    List<LineChartData> lineChartData,
    //alarm
    double priceAlarm,
  }) {
    return AppDataState(
      appTheme: appTheme ?? this.appTheme,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      coins: coins ?? this.coins,
      coinTaken: coinTaken ?? this.coinTaken,
      currentUser: currentUser ?? this.currentUser,
      chartsData: chartsData ?? this.chartsData,
      chartTimeframe: chartTimeframe ?? this.chartTimeframe,
      lineChartData: lineChartData ?? this.lineChartData,
      priceAlarm: priceAlarm ?? this.priceAlarm,
    );
  }
}
