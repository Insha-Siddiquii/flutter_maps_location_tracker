import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsConfiguration {
  static const apiKey = '<add your api key>';
  static const baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  static const double cameraZoom = 15;
  static const double cameraTilt = 8;
  static const double cameraBearing = 30;
  static const LatLng deliveryLocation = LatLng(24.9018717, 67.1798177);
  static const LatLng pickUpLocation = LatLng(24.9032584, 67.1817941);
  static const LatLng driverInititalLocation = LatLng(24.902791, 67.1850278);
  // static const LatLng driverInititalLocation = LatLng(24.9031946, 67.1808909);
}
