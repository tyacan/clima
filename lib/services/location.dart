import 'package:geolocator/geolocator.dart';

class Location {
  double _latitude;
  double _longitude;

  String _googleMapShareLink;
  Location() {
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      _latitude = position.latitude;
      _longitude = position.longitude;
      _googleMapShareLink =
          'https://www.google.com/maps/search/?api=1&query=${_latitude.toString()},${_longitude.toString()}';
    } catch (e) {
      print(e);
    }
  }

  getLat() {
    return _latitude;
  }

  getLong() {
    return _longitude;
  }

  getGoogleMapShareLink() {
    return _googleMapShareLink;
  }

  
}
