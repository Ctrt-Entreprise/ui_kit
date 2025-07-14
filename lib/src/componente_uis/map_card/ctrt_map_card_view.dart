import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CtrtMapCardView extends StatelessWidget {
  final double height;
  final LatLng center;
  final double zoom;
  final List<Marker> markers;

  const CtrtMapCardView({
    super.key,
    this.height = 300,
    required this.center,
    this.zoom = 13.0,
    this.markers = const [],
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: FlutterMap(
        options: MapOptions(initialCenter: center, initialZoom: zoom),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
            maxZoom: 19,
          ),
          MarkerLayer(markers: markers),
        ],
      ),
    );
  }
}
