import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:foodtek/features/track/views/widgets/order_status.dart';
import '../../../order_details/views/screen/order_details_screen.dart';

enum DeliveryStatus { orderPlaced, onTheWay, delivered }

class TrackScreen extends StatefulWidget {
  final LatLng deliveryLocation;
  final String placeName;

  const TrackScreen({
    super.key,
    required this.deliveryLocation,
    required this.placeName,
  });

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  final LatLng _driverLocation =
      const LatLng(31.925063200173774, 35.89917597552506);
  late LatLng _deliveryLocation;
  late String _placeName;

  DeliveryStatus currentStatus = DeliveryStatus.onTheWay;

  late BitmapDescriptor homeIcon;
  late BitmapDescriptor resIcon;

  @override
  void initState() {
    super.initState();
    _deliveryLocation = widget.deliveryLocation;
    _placeName = widget.placeName;
    _loadCustomMarker();
    _animateToDriver();
  }

  Future<void> _loadCustomMarker() async {
    homeIcon = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/home_marker1.png',
    );
    resIcon = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/restaurant.png',
    );
    setState(() {});
  }

  Future<void> _animateToDriver() async {
    final controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(_driverLocation, 15));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: _driverLocation, zoom: 15),
            onMapCreated: (controller) => _controller.complete(controller),
            markers: {
              Marker(
                markerId: const MarkerId("driver"),
                position: _driverLocation,
                icon: resIcon,
                infoWindow: const InfoWindow(title: "Driver Location"),
              ),
              Marker(
                markerId: const MarkerId("destination"),
                position: _deliveryLocation,
                icon: homeIcon,
                infoWindow: InfoWindow(title: _placeName),
              ),
            },
            polylines: {
              Polyline(
                polylineId: const PolylineId("route"),
                color: Colors.green,
                width: 4,
                points: [_driverLocation, _deliveryLocation],
              ),
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatusIndicator(),
                  const SizedBox(height: 20),
                  OrderStatus(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusIndicator() {
    String getLabel(DeliveryStatus status) {
      switch (status) {
        case DeliveryStatus.orderPlaced:
          return "Order Placed";
        case DeliveryStatus.onTheWay:
          return "On The Way";
        case DeliveryStatus.delivered:
          return "Delivered";
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              getLabel(currentStatus),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(placeName: _placeName),
                  ),
                );
              },
              child: const Text(
                "All Details",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildStep("Order Placed", currentStatus.index >= 0,
                currentStatus == DeliveryStatus.orderPlaced),
            _buildStep("On The Way", currentStatus.index >= 1,
                currentStatus == DeliveryStatus.onTheWay),
            _buildStep("Delivered", currentStatus.index >= 2,
                currentStatus == DeliveryStatus.delivered),
          ],
        ),
      ],
    );
  }

  Widget _buildStep(String label, bool isFilled, bool isActive) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.green : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 4,
            decoration: BoxDecoration(
              color: isFilled ? Colors.green : Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
