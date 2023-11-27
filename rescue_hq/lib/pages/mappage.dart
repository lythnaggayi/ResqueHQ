import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rescue_hq/consts.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // ignore: unnecessary_new, prefer_final_fields

  Location _locationController = new Location();
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  // ignore: avoid_init_to_null

  LatLng? currentP = null;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();

    getLocationUpdates().then((_) => {
          getPolyLinePoints()
              .then((coordinates) => {generatePolylinefromPoints(coordinates)})
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentP == null
          ? const Center(
              child: CircularProgressIndicator.adaptive(
              backgroundColor: Color(0xFFFFD600),
            ))
          : GoogleMap(
              onMapCreated: ((GoogleMapController controller) =>
                  _mapController.complete(controller)),
              initialCameraPosition: const CameraPosition(
                  target: LatLng(0.3326, 32.5686), zoom: 13.0),
              markers: {
                Marker(
                    markerId: const MarkerId("currentLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: currentP!),
                const Marker(
                    markerId: MarkerId("sourceLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: LatLng(0.3326, 32.5686)),
                const Marker(
                    markerId: MarkerId("destinationLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: LatLng(0.3246, 32.5687))
              },
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              myLocationButtonEnabled: true,
              polylines: Set<Polyline>.of(polylines.values),
            ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(target: pos, zoom: 15.0);

    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  Future<void> getLocationUpdates() async {
    bool serviceEnabled;

    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();

    if (serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await _locationController.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
    }

    if (permissionGranted != PermissionStatus.granted) {
      return;
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(currentP!);
        });
      }
    });
  }

  Future<List<LatLng>> getPolyLinePoints() async {
    List<LatLng> polyLineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        GOOGLE_MAPS_API_KEY,
        const PointLatLng(0.3326, 32.5686),
        const PointLatLng(0.3246, 32.5687),
        travelMode: TravelMode.driving);

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polyLineCoordinates;
  }

  void generatePolylinefromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: const Color(0xFFFFD600),
        points: polylineCoordinates,
        width: 8);

    setState(() {
      polylines[id] = polyline;
    });
  }
}
