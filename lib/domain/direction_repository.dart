import 'package:flutter_app_location_tracker/application/map_home/models/direction.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class DirectionRepository {
  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destination,
  });
}
