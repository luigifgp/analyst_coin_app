import './app_state.dart';
import './action_state.dart';

coinsReducer(AppDataState prevState, SetCoinsStateAction action) {
  final payload = action.appDtState;

  return prevState.copyWith(
    appTheme: payload.appTheme,
    currentUser: payload.currentUser,
    isError: payload.isError,
    isLoading: payload.isLoading,
    coins: payload.coins,
    coinTaken: payload.coinTaken,
    chartsData: payload.chartsData,
    chartTimeframe: payload.chartTimeframe,
    lineChartData: payload.lineChartData,
    priceAlarm: payload.priceAlarm,
  );
}
