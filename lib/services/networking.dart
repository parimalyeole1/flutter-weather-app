import 'dart:convert';

import 'package:http/http.dart' as http;

const openWeatherAPIKEY = 'some';

class WeatherHttpService {
  getDataByLocation({double lat, double long}) async {
    try {
      http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$openWeatherAPIKEY&units=metric',
      );
      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('Error:getDataByLocation');
      print(e);
    }
  }
}
