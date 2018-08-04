import 'dart:async';
import 'dart:convert';
import '../models/WeatherEntry.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  static final WeatherApi _weatherApi = new WeatherApi._internal();

  static final String appId = '1334f814316ce2b4215d20261be774af';
  static final String id = '524901';
  static final String unit = "metric";
  static String defaultCity = 'London';
  static var cities = jsonDecode('assets/data.json');

  factory WeatherApi() {
    return _weatherApi;
  }

  WeatherApi._internal();

  static Future<WeatherEntry> fetchData(String location) async {

    print(cities);

    String url = "http://api.openweathermap.org/data/2.5/weather?q=" +
        WeatherApi.defaultCity +
        "&appid=" +
        WeatherApi.appId +
        "&id=" +
        WeatherApi.id +
        "&units=metric";

    http.Response response = await http.get(url);
    Map data = jsonDecode(response.body);

    var entry = new WeatherEntry();
    entry.setTemperature(data['main']['temp']);
    entry.setHigh(data['main']['temp_max']);
    entry.setLow(data['main']['temp_min']);
    entry.setHumidity(data['main']['humidity']);
    entry.setPressure(data['main']['pressure']);

    return entry;
  }

}
