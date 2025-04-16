import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:foodtek/core/utils/responsive.dart';
import '../../../../core/theme/app_colors/app_light_colors.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng _selectedLocation = const LatLng(31.963158, 35.930359);
  final TextEditingController _searchController = TextEditingController();
  String _placeName = '';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return Future.error('Location services are disabled.');

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    LatLng current = LatLng(position.latitude, position.longitude);

    setState(() {
      _selectedLocation = current;
    });

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(current, 16));
    _getPlaceName(current);
  }

  Future<void> _getPlaceName(LatLng location) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        setState(() {
          _placeName =
              "${place.street}, ${place.subLocality}, ${place.locality}, ${place.country}";
        });
      }
    } catch (e) {
      setState(() {
        _placeName = "";
      });
    }
  }

  Future<void> _searchLocation() async {
    String query = _searchController.text.trim();
    if (query.isEmpty) return;

    try {
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        LatLng searchedLocation =
            LatLng(locations[0].latitude, locations[0].longitude);

        setState(() {
          _selectedLocation = searchedLocation;
        });

        final GoogleMapController controller = await _controller.future;
        controller.animateCamera(
          CameraUpdate.newLatLngZoom(searchedLocation, 16),
        );

        _getPlaceName(searchedLocation);
      }
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: _selectedLocation,
              zoom: 16,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            myLocationEnabled: true,
            onCameraIdle: () => _getPlaceName(_selectedLocation),
            onCameraMove: (position) {
              _selectedLocation = position.target;
            },
          ),
          const Center(
            child: Icon(Icons.location_on,
                size: 40, color: AppLightColors.tertiary),
          ),
          Positioned(
            top: responsiveHeight(context, 10),
            left: responsiveWidth(context, 39),
            right: responsiveWidth(context, 60),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 16),
                vertical: responsiveHeight(context, 17),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(responsiveWidth(context, 40)),
                border: Border.all(color: const Color(0xFFD6D6D6), width: 1),
              ),
              child: Row(
                children: [
                  Icon(Icons.search,
                      color: Colors.grey, size: responsiveWidth(context, 20)),
                  SizedBox(width: responsiveWidth(context, 8)),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onSubmitted: (_) => _searchLocation(),
                      decoration: InputDecoration(
                        hintText: 'Find your location',
                        hintStyle: TextStyle(
                          fontSize: responsiveWidth(context, 14),
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: responsiveHeight(context, 14),
            left: responsiveWidth(context, 2),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            bottom: responsiveHeight(context, 120),
            left: responsiveWidth(context, 20),
            right: responsiveWidth(context, 20),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_pin,
                          color: AppLightColors.tertiary),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _placeName.isNotEmpty
                              ? _placeName
                              : 'Loading address...',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppLightColors.tertiary,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.pop(context, {
                        'location': _selectedLocation,
                        'placeName': _placeName,
                      });
                    },
                    child: const Text("Set Location",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
