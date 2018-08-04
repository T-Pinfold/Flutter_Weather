import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../backend/WeatherApi.dart';
import '../models/WeatherEntry.dart';
import 'CityPicker.dart';

class FlutterWeather extends StatefulWidget {
  @override
  _FlutterWeatherState createState() => new _FlutterWeatherState();
}

class _FlutterWeatherState extends State<FlutterWeather> {
  WeatherEntry weather = new WeatherEntry();

  void initState() {
    super.initState();
  }

  void _getWeatherEntry() async {
    WeatherEntry weatherEntry = await WeatherApi.fetchData("London");
    this.setState(() {
      weather = weatherEntry;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('FlutterWeather',
              style: new TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w100)),
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () => _getWeatherEntry())
          ],
        ),
        body: new Stack(
          children: <Widget>[
            new Center(
              child: new Image.asset('assets/images/umbrella.png',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center
              ),
            ),
            new Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
                child: new InkWell(
                    child: new Text(
                      "London",
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 49.0,
                          fontWeight: FontWeight.w200),
                    ),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CityPicker())))),
            new Container(
              margin: const EdgeInsets.fromLTRB(30.0, 290.0, 0.0, 0.0),
              child: new Text("${weather.temperature}\u{2103}",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 49.0,
                      fontWeight: FontWeight.w300)),
            ),
            new Container(
              margin: const EdgeInsets.fromLTRB(35.0, 350.0, 0.0, 0.0),
              child: new Text("Humidity: ${weather.humidity}",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 39.0,
                      fontWeight: FontWeight.w200)),
            ),
            new Container(
              margin: const EdgeInsets.fromLTRB(35.0, 400.0, 0.0, 0.0),
              child: new Text("High: ${weather.high}\u{2103}",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 39.0,
                      fontWeight: FontWeight.w200)),
            ),
            new Container(
              margin: const EdgeInsets.fromLTRB(35.0, 450.0, 0.0, 0.0),
              child: new Text("Low: ${weather.low}\u{2103}",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 39.0,
                      fontWeight: FontWeight.w200)),
            ),
          ],
        ));
  }
}
