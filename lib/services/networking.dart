import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper{
  NetworkHelper(this.url, this.locationUrl);
  final String url;
  final String locationUrl ;


  Future getData() async {
    // 5292524fa54041cfe87a5e3130eba1b4  api key
    var realUrl = Uri.parse(url);
    http.Response response = await http.get(realUrl);
    if(response.statusCode ==200){
      var decodedData = jsonDecode(response.body);
      return decodedData;

    } else{
      print(response.statusCode);
    }

  }
  Future getLocationData() async{
    var realLocationUrl = Uri.parse(locationUrl);
    http.Response responseLocation = await http.get(realLocationUrl);

    var decodedLocationData = jsonDecode(responseLocation.body);
    if(responseLocation.statusCode ==200){
      return decodedLocationData;
    } else{
      print(responseLocation.statusCode);
    }
  }
}

