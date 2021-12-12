
import 'package:geolocator/geolocator.dart';

class LocationHelper{
  static Future<Position> determineCurrentLocation()async{
    await Geolocator.requestPermission();
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}