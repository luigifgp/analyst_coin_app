import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final Uri url;
  static int statusCode;

  Future getData() async {
    http.Response response = await http.get(url);

    statusCode = response.statusCode;
    if (response.statusCode == 200) {
      var decodedData = response.body;

      return decodedData;
    } else {
      return response.statusCode;
    }
  }
}
