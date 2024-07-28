import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/data/remote/eror_handel/eror_handel.dart';
import 'package:weather_app/models/weather.dart';

class ApiServices {
  final String? baseUrl = dotenv.env['API_URL'];
  final String? appID = dotenv.env['API_KEY'];

  Future<List<Weather>> fetchWetaher(Dio dio) async {
    List<Weather> listData = [];
    try {
      var response = await dio.get("$baseUrl", queryParameters: {
        'lat': '-6.175115064391812',
        'lon': '106.82708842419382',
        'appid': appID,
        'units': 'metric'
      }).safeError();

      if (response.statusCode == 200) {
        var data = response.data['list'];
        for (var item in data) {
          Weather dataJson = Weather.fromJson(item);
          listData.add(dataJson);
        }
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw e.toString();
    }

    return listData;
  }
}
