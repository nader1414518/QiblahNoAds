import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import '../core/models/enums.dart';
import '../core/models/models.dart';
import 'preferences_service.dart';

class LocationService {
  LocationService(this._preferences);

  final PreferencesService _preferences;
  List<City>? _cities;
  static Future<LocationPermission>? _ongoingPermissionRequest;

  Future<LocationPermission> ensurePermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.denied) {
      return permission;
    }

    final ongoing = _ongoingPermissionRequest;
    if (ongoing != null) {
      return ongoing;
    }

    final request = Geolocator.requestPermission();
    _ongoingPermissionRequest = request;
    try {
      return await request;
    } finally {
      _ongoingPermissionRequest = null;
    }
  }

  Future<List<City>> loadCities() async {
    if (_cities != null) {
      return _cities!;
    }

    final raw = await rootBundle.loadString('lib/data/cities.json');
    final decoded = jsonDecode(raw) as List<dynamic>;
    _cities = decoded
        .map((entry) => City.fromJson(entry as Map<String, dynamic>))
        .toList();
    return _cities!;
  }

  Future<AppLocation?> getSavedLocation() async {
    final lat = _preferences.getLatitude();
    final lng = _preferences.getLongitude();
    final cityName = _preferences.getCityName();
    final source = _preferences.getLocationSource();

    if (lat == null || lng == null || cityName == null || source == null) {
      return null;
    }

    return AppLocation(
      latitude: lat,
      longitude: lng,
      cityName: cityName,
      source: source,
    );
  }

  Future<AppLocation?> fetchGpsLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    final permission = await ensurePermission();

    if (permission != LocationPermission.always &&
        permission != LocationPermission.whileInUse) {
      return null;
    }

    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.low,
        timeLimit: Duration(seconds: 10),
      ),
    );

    const cityName = 'Current Location';
    await _preferences.saveLocation(
      latitude: position.latitude,
      longitude: position.longitude,
      cityName: cityName,
      source: LocationSource.gps,
    );

    return AppLocation(
      latitude: position.latitude,
      longitude: position.longitude,
      cityName: cityName,
      source: LocationSource.gps,
    );
  }

  Future<AppLocation> saveManualCity(City city) async {
    await _preferences.saveLocation(
      latitude: city.lat,
      longitude: city.lng,
      cityName: city.displayName,
      source: LocationSource.manual,
    );

    return AppLocation(
      latitude: city.lat,
      longitude: city.lng,
      cityName: city.displayName,
      source: LocationSource.manual,
    );
  }
}
