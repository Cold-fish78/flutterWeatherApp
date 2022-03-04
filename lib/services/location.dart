import 'package:geolocator/geolocator.dart';


class Location{
 late double latitude;
 late double longitude;
  void getCurrentLocation() async {
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
     latitude = position.latitude;
     longitude = position.longitude;
     print(latitude);
    } catch(e){
      print(e);
    }

  }
}