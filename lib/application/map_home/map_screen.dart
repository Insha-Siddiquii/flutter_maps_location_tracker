import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_location_tracker/application/configs/configs.dart';
import 'package:flutter_app_location_tracker/application/map_home/models/direction.dart';
import 'package:flutter_app_location_tracker/application/map_home/widgets/delivery_rating_bar.dart';
import 'package:flutter_app_location_tracker/application/map_home/widgets/delivery_rating_submission.dart';
import 'package:flutter_app_location_tracker/application/map_home/widgets/map_info_card.dart';
import 'package:flutter_app_location_tracker/application/map_home/widgets/map_notification_alert.dart';
import 'package:flutter_app_location_tracker/application/map_home/widgets/map_timeline.dart';
import 'package:flutter_app_location_tracker/application/map_home/widgets/map_timeline_info.dart';
import 'package:flutter_app_location_tracker/application/map_home/widgets/pickup_delivery_info.dart';
import 'package:flutter_app_location_tracker/application/map_home/widgets/user_avatar.dart';
import 'package:flutter_app_location_tracker/application/map_home/widgets/user_info.dart';
import 'package:flutter_app_location_tracker/data/http/map_services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final CameraPosition _initialCameraPosition = const CameraPosition(
    zoom: MapsConfiguration.cameraZoom,
    tilt: MapsConfiguration.cameraTilt,
    target: MapsConfiguration.driverInititalLocation,
  );

  GoogleMapController? _mapController;
  Marker? _pickupPoint;
  Marker? _deliveryPoint;
  Marker? _driverPoint;
  final Set<Marker> _markers = {};
  BitmapDescriptor? pickUpIcon;
  BitmapDescriptor? deliveryIcon;
  BitmapDescriptor? driverIcon;
  Directions? _driverPickupinfo;
  Directions? _pickupDeliveryinfo;
  List<String> data = [
    'On the Way',
    'Picked up Delivery',
    'Near Delivery Destination',
    'Delivered Package'
  ];
  final Location _locationData = Location();

  @override
  void initState() {
    setMarkersIcons();
    super.initState();
  }

  @override
  void dispose() {
    _mapController!.dispose();
    super.dispose();
  }

  void setMarkersIcons() async {
    driverIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/driver.png',
    );
    pickUpIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5), 'assets/pickup.png');

    deliveryIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5), 'assets/delivery.png');
  }

  _setCameraPosition() {
    _mapController!
        .animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
    Future.delayed(const Duration(seconds: 2), () {
      _addMarkers(
        pickUpLatLng: MapsConfiguration.pickUpLocation,
        drLatLng: MapsConfiguration.driverInititalLocation,
        dLatLng: MapsConfiguration.deliveryLocation,
      );
    });

    setDriverPickUpDirection(
        origin: MapsConfiguration.driverInititalLocation,
        destination: MapsConfiguration.pickUpLocation);
    // setDriverPickUpDirection(
    //     origin: MapsConfiguration.driverInititalLocation, destination: MapsConfiguration.deliveryLocation);
  }

  setDriverPickUpDirection(
      {required LatLng origin, required LatLng destination}) async {
    final direction = await MapServices().getDirections(
      origin: origin,
      destination: destination,
    );
    setState(() {
      _driverPickupinfo = direction!;
    });
    Future.delayed(const Duration(seconds: 10), () {
      _locationData.onLocationChanged.listen((LocationData currentLocation) {
        _mapController!
            .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          zoom: MapsConfiguration.cameraZoom,
          tilt: MapsConfiguration.cameraTilt,
          target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        )));

        _addMarkers(
          pickUpLatLng: MapsConfiguration.pickUpLocation,
          drLatLng:
              LatLng(currentLocation.latitude!, currentLocation.longitude!),
          dLatLng: MapsConfiguration.deliveryLocation,
        );
        if (!_driverPickupinfo!.driverAtPickup) {
          // setDriverPickUpDirection(
          //     origin:
          //         LatLng(currentLocation.latitude!, currentLocation.longitude!),
          //     destination: MapsConfiguration.pickUpLocation);

          setDriverPickUpDirection(
              origin:
                  LatLng(currentLocation.latitude!, currentLocation.longitude!),
              destination: MapsConfiguration.deliveryLocation);
        } else {
          MapAlertNotification.showAlertDialog(
            'Hi I\'m Driver',
            'Reached Pickup Location',
            context,
          );
          setPickUpDeliveryDirection(
              origin: MapsConfiguration.pickUpLocation,
              destination: MapsConfiguration.deliveryLocation);
        }
      });
    });
  }

  setPickUpDeliveryDirection(
      {required LatLng origin, required LatLng destination}) async {
    final direction = await MapServices().getDirections(
      origin: MapsConfiguration.pickUpLocation,
      destination: MapsConfiguration.deliveryLocation,
    );
    setState(() {
      _pickupDeliveryinfo = direction!;
    });
    Future.delayed(const Duration(seconds: 10), () {
      _locationData.onLocationChanged.listen((LocationData currentLocation) {
        _mapController!
            .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          zoom: MapsConfiguration.cameraZoom,
          tilt: MapsConfiguration.cameraTilt,
          target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        )));

        _addMarkers(
          pickUpLatLng: MapsConfiguration.pickUpLocation,
          drLatLng:
              LatLng(currentLocation.latitude!, currentLocation.longitude!),
          dLatLng: MapsConfiguration.deliveryLocation,
        );
        if (!_pickupDeliveryinfo!.driverAtPickup) {
          setDriverPickUpDirection(
            origin:
                LatLng(currentLocation.latitude!, currentLocation.longitude!),
            destination: MapsConfiguration.deliveryLocation,
          );
        } else {
          MapAlertNotification.showAlertDialog(
            'Hi I\'m Driver',
            'Reached Delivery Location',
            context,
          );
        }
      });
    });
  }

  _addMarkers({required pickUpLatLng, required drLatLng, required dLatLng}) {
    _driverPoint = Marker(
      markerId: const MarkerId('driver'),
      position: drLatLng,
      icon: driverIcon!,
      infoWindow: const InfoWindow(title: 'Hi, I\'m Driver'),
    );
    _pickupPoint = Marker(
      markerId: const MarkerId('pickup'),
      position: pickUpLatLng,
      icon: pickUpIcon!,
      infoWindow: const InfoWindow(title: 'Pickup Point'),
    );
    _deliveryPoint = Marker(
      markerId: const MarkerId('delivery'),
      position: dLatLng,
      icon: deliveryIcon!,
      infoWindow: const InfoWindow(title: 'Delivery Point'),
    );

    setState(() {
      _markers.addAll([_driverPoint!, _pickupPoint!, _deliveryPoint!]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableBottomSheet(
      enableToggle: false,
      background: GoogleMap(
        zoomControlsEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.terrain,
        initialCameraPosition: _initialCameraPosition,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
          _setCameraPosition();
        },
        polylines: {
          if (_driverPickupinfo != null)
            Polyline(
              polylineId: const PolylineId('driver_pickup_polyline'),
              color: Colors.blueAccent,
              width: 5,
              points: _driverPickupinfo!.polylinePoints
                  .map((e) => LatLng(e.latitude, e.longitude))
                  .toList(),
            ),
        },
      ),
      persistentContentHeight: 350,
      expandableContent: Stack(
        children: [
          const MapInfoCard(),
          const UserAvatar(),
          const UserInfo(),
          if (_driverPickupinfo != null)
            if (_driverPickupinfo!.deliveryCompleted) ...[
              const DeliveryRatingBar(),
              const PickupDeliveryInfo(),
              const DeliveryRatingSubmission(),
            ] else if (_driverPickupinfo!.totalDistance.isNotEmpty) ...[
              MapDeliveryTimeline(data: data),
              MapTimelineInfo(data: data),
            ]
        ],
      ),
    );
  }
}
