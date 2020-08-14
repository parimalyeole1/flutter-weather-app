import 'dart:convert';

import 'package:http/http.dart' as http;

// TODO: use right api key
const openWeatherAPIKEY = 'Enter right Api key';
const openWeatherBaseURI = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherHttpService {
  getDataByCity(String city) async {
    try {
      http.Response response = await http.get(
        '$openWeatherBaseURI?q=$city&appid=$openWeatherAPIKEY&units=metric',
      );
      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        print('Failure:getDataByCity responseCode ${response.statusCode}');
      }
    } catch (e) {
      print('Error:getDataByLocation');
      print(e);
    }
  }

  getDataByLocation({double lat, double long}) async {
    try {
      http.Response response = await http.get(
        '$openWeatherBaseURI?lat=$lat&lon=$long&appid=$openWeatherAPIKEY&units=metric',
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
