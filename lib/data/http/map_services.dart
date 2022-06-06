import 'package:dio/dio.dart';
import 'package:flutter_app_location_tracker/application/configs/configs.dart';
import 'package:flutter_app_location_tracker/application/map_home/models/direction.dart';
import 'package:flutter_app_location_tracker/domain/direction_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapServices implements DirectionRepository {
  final Dio _dio = Dio();

  @override
  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    try {
      final response = await _dio.get(
        MapsConfiguration.baseUrl,
        queryParameters: {
          'origin': '${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'key': MapsConfiguration.apiKey,
        },
      );

      if (response.statusCode == 200 &&
          response.data['status'] != 'OVER_QUERY_LIMIT') {
        return Directions.fromMap(response.data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
