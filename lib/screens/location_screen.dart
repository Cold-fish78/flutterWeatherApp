import 'package:flutter/material.dart';
import 'package:clima_project/utilities/constants.dart';
import 'package:clima_project/services/weather.dart';
import 'package:clima_project/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.locationWeather,this.cityName});
  final locationWeather;
  final cityName;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  WeatherModel weatherModel = WeatherModel();
  late int temperature;
  late int condition;
  late String cityName;
  late String weatherIcon;
  late String message ;
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }
 void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData ==null){
        temperature =0;
        weatherIcon = 'Error';
        message = 'unable to get weather data';
        cityName ='';
        return;
      }
      double temp= weatherData['main']['temp'];
      temperature = temp.toInt();
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      message = weatherModel.getMessage(temperature);
    });





 }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{

                      var weatherData = await widget.locationWeather;

                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                    var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                    print(typedName);
                    if(typedName != null){
                     var weatherData = await  weatherModel.getCityWeather(typedName);
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
                  "$message in $cityName",
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
