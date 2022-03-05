import 'package:geolocator/geolocator.dart';


class Location{
   late double latitude ;
  late double longitude;
   Future<void> getLocation() async {

     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
     latitude = position.latitude;
     longitude = position.longitude;
     print(latitude);
     print(longitude);



   }
   double getLatitude(){
     return latitude;
   }


}