import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_project/services/location.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  getLocation();
  }

  void getLocation() async{
    Location location = Location();
    location.getCurrentLocation();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {

            print('button pressed');
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
