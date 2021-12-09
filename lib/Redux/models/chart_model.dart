import 'package:intl/intl.dart';

class ChartsData {
  double open, close, high, low;
  var btcVolume;
  DateTime time;

  ChartsData.chartFromJson(Map<String, dynamic> json) {
    if (json == null) return;

    open = double.parse(json['open']);
    high = double.parse(json['high']);
    low = double.parse(json['low']);
    close = double.parse(json['close']);
    btcVolume = json['btcVolume'];
    time = DateTime.parse(json['time']);

    //date = DateTime.fromMicrosecondsSinceEpoch(json['period'] * 1000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open'] = this.open;
    data['high'] = this.high;
    data['low'] = this.low;
    data['close'] = this.close;
    data['btcVolume'] = this.btcVolume;
    data['time'] = this.time;

    return data;
  }

  static List<ChartsData> chartListFromJson(List<dynamic> json) {
    return json != null
        ? json.map((value) => ChartsData.chartFromJson(value)).toList()
        : null;
  }
}

/// Line Chart Model

class LineChartData {
  double close;
  DateTime time;

  LineChartData.lineChartFromJson(Map<String, dynamic> json) {
    if (json == null) return;
    close = double.parse(json['close']);
    DateTime timeD = DateTime.parse(json['time']);
    time = DateTime.parse(json['time']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['close'] = this.close;
    data['time'] = this.time;
    return data;
  }

  static List<LineChartData> lineChartListFromJson(List<dynamic> json) {
    return json != null
        ? json.map((value) => LineChartData.lineChartFromJson(value)).toList()
        : null;
  }
}
