import 'package:analyst_coin/services/notificationHelper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class CoinAlarm {
  double priceC;
  double priceH;
  double priceL;
  double priceSet;
  int i = 0;

  CoinAlarm({this.priceC, this.priceH, this.priceL, this.priceSet});

  void notificationActive() {
    if (priceC == priceSet || priceH == priceSet || priceL == priceSet) {
      showNotification(
          flutterLocalNotificationsPlugin, 'AlERT YOUR PRICE', '$priceSet');
    }
  }
}
