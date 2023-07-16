import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recherche de trajet'),
      ),
      body: Center(
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(14.6927, -17.4467), // Coordonnées de Dakar
            zoom: 12.0, // Niveau de zoom initial
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", // Source des tuiles de la carte (OpenStreetMap)
              subdomains: ['a', 'b', 'c'], // Sous-domaines pour les tuiles de la carte
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(14.6927, -17.4467), // Coordonnées de Dakar
                  builder: (ctx) => Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
