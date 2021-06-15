import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Position? currentPosition;
  void getLocation() {
    Geolocator
    .getCurrentPosition(desiredAccuracy: LocationAccuracy.low,forceAndroidLocationManager: true)
        .then((Position position) {
          setState(() {
            currentPosition = position;
          });
    }).catchError((e){
      print(e);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (currentPosition!=null) Text(
              "LAT ${currentPosition?.latitude},LNG ${currentPosition?.longitude}"
            )
            ,ElevatedButton(
              onPressed: () {
                getLocation();
              },
              child: Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}
