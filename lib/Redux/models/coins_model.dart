class Coins {
  String id, name, shortName, percentage, price, type;

  Coins.cryptoFromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    shortName = json['symbol'];
    price = json['priceUsd'];
    percentage = json['changePercent24Hr'];
    type = 'crypto';
  }

  static List<Coins> cryptoListFromJson(List<dynamic> json) {
    return json != null
        ? json.map((value) => Coins.cryptoFromJson(value)).toList()
        : null;
  }

  Coins.forexFromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['s'];
    shortName = null;
    price = json['c'];
    percentage = json['cp'];
    type = 'forex';
  }

  static List<Coins> forexListFromJson(List<dynamic> json) {
    return json != null
        ? json.map((value) => Coins.forexFromJson(value)).toList()
        : null;
  }
}

class CoinTaken {
  CoinTaken({this.name, this.shortName, this.percentage, this.price, this.type});
  String name;
  String shortName;
  String percentage;
  String price;
  String type;
}
