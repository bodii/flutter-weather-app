import 'package:geocode/geocode.dart';
import 'package:location/location.dart';

Future<LocationData?> getLocation() async {
  Location location = Location();
  LocationData locationData;

  bool serviceEnabled;
  PermissionStatus permissionGranted;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return null;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }

  locationData = await location.getLocation();

  return locationData;
}

Future<Address?> getAddress(double? lat, double? long) async {
  if (lat == null || long == null) return null;
  GeoCode geoCode = GeoCode();
  Address address =
      await geoCode.reverseGeocoding(latitude: lat, longitude: long);
  return address;
}
