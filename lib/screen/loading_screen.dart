import 'dart:async';

import 'package:clima/screen/location_screen.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {
  var weatherData;
  @override
  void initState(){
    super.initState();
    _getLocationData();
    Timer(
      Duration(seconds: 4),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LocationScreen(
          locationWeather: weatherData,
        ),
        ),
      ),
    );
  }
  void _getLocationData() async {
    weatherData = await WeatherModel().getLocationWeather();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FDFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'WEATHER APP',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: SpinKitCubeGrid(
              color: Color(0xFF101010),
              size: 90.0,
            ),
          ),
          Text(
            'by @Priyam_Garg'
          ),
        ],
      ),
    );
  }
}
