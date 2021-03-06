import 'networking.dart';

const appId = '5292524fa54041cfe87a5e3130eba1b4';
class WeatherModel {
  Future<dynamic> getCityWeather (String cityName) async{
    var url = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$appId&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url,"https://api.openweathermap.org/geo/1.0/reverse?lat=26&lon=83&limit=5&appid=$appId" )
    ;
    networkHelper.getLocationData();
    var weatherData =  await networkHelper.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
