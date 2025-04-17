import 'package:flutter/material.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationHelper {
  static Future<String?> getCurrentAddress(BuildContext context) async {
    final l10n = context.l10n; // for build context async gaps
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return l10n.location_service_disabled;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return l10n.location_permission_denied;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return l10n.location_permission_denied_forever;
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      final place = placemarks.first;
      return [
        place.subLocality,
        place.locality,
      ].where((part) => part != null && part.isNotEmpty).join(", ");
    }
    return l10n.location_unknown;
  }
}
