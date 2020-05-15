import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
  Future getWeatherData() async {
    print('url = $url');
    http.Response response = await http.get(url);
    if (response.statusCode == 200)
    {
      String data = response.body;
      return jsonDecode(data);
    }
        else {
          print(response.statusCode);
        }
      }
    }

