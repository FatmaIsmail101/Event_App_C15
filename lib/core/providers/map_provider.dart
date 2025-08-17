import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapProvider extends ChangeNotifier {
  Location location = Location();
  String locationMessage = '';
  LatLng? eventLocation;
  Set<Marker> markers = {
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(37.42796133580664, -122.085749655962),
    ),
  };
  late GoogleMapController googleMapController;

  CameraPosition cameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<void> getLocation() async {
    notifyListeners();
    bool locationPerimissionGranted = await _getLocationPermission();
    if (!locationPerimissionGranted) {
      locationMessage = 'Location is Denied';
      notifyListeners();
      return;
    }
    bool locationServiceEnabled = await _locationServiceEnabled();
    if (!locationServiceEnabled) {
      locationMessage = 'Location Service Disabled';
      notifyListeners();
    }
    notifyListeners();
    LocationData locationData = await location.getLocation();
    changeLocationOnMap(locationData);
    notifyListeners();
  }

  Future<bool> _getLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> _locationServiceEnabled() async {
    bool locationServiceEnabled = await location.serviceEnabled();
    if (!locationServiceEnabled) {
      locationServiceEnabled = await location.requestService();
    }
    return locationServiceEnabled;
  }

  void changeLocationOnMap(LocationData locationData) {
    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0),
      zoom: 25,
    );
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
    markers.add(
      Marker(
        markerId: MarkerId(UniqueKey().toString()),
        position: LatLng(
          locationData.latitude ?? 0,
          locationData.longitude ?? 0,
        ),
      ),
    );
    notifyListeners();
  }
  void setLocationListner() {
    location.changeSettings(accuracy: LocationAccuracy.high, interval: 1000);
    location.onLocationChanged.listen((locationData) {
      changeLocationOnMap(locationData);
    });
  }
  void setEventLocation(LatLng newEventLocation) {
    eventLocation = newEventLocation;
    notifyListeners();
  }
}
