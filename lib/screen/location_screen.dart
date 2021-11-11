import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';
import 'package:clima/services/utilities.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}
class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weatherModel = WeatherModel();
  late int temperature;
  late String message;
  late String weatherIcon;
  String? cityName;
  late String week;
  late String month;
  late String date;
  late String year;

  @override
  void initState(){
    super.initState();
    updateUI(widget.locationWeather);
    var dateTime = new DateTime.now();
    week = weekName(dateTime.weekday);
    month = monthName(dateTime.month);
    date = dateTime.day.toString();
    year = dateTime.year.toString();
  }
  void updateUI(dynamic weatherData){
    setState(() {
      if (weatherData==null){
        temperature = 0;
        weatherIcon = 'Error';
        message = 'Unable to fetch data';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      int condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      cityName = weatherData['name'];
      message = weatherModel.getMessage(temperature);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFF9FDFF),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
              size: 40.0,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('images/location_background.jpg'),
          //   fit: BoxFit.fill,
          //   colorFilter: ColorFilter.mode(
          //       Colors.white.withOpacity(0.8), BlendMode.dstATop),
          // ),
          // gradient: LinearGradient(
          //     colors: [
          //       // const Color(0xFF9073D8),
          //       // const Color(0xFF9073D8),
          //       const Color(0xFFF9FDFF),
          //       const Color(0xFFC9E3F7),
          //     ],
          //     begin: const FractionalOffset(0.0, 0.0),
          //     end: const FractionalOffset(0.0, 1.0),
          //     stops: [0.0, 1.0],
          //     tileMode: TileMode.clamp
          // ),
          color: Color(0xFFF9FDFF),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.location_on_outlined,
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                  Text(
                    '$cityName',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontFamily: 'Monospace',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  '$week $month $date $year',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Times',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context){
                        return CityScreen();
                      }));
                      if (typedName!=null){
                        var weatherData = await weatherModel.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}