import 'dart:convert';
import 'package:clima_project/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_project/services/location.dart';
import 'package:http/http.dart';
import 'package:clima_project/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const appId = '5292524fa54041cfe87a5e3130eba1b4';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  late double latitude;
  late double longitude;

  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    Location location = Location();
    await location.getLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$appId&units=metric",
        "https://api.openweathermap.org/geo/1.0/reverse?lat=${location.latitude}&lon=${location.longitude}&limit=5&appid=$appId");
    var weatherData = await networkHelper.getData();
    print(weatherData);
    var locationData = await networkHelper.getLocationData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
              locationWeather: weatherData,);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
