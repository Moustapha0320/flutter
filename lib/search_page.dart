import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
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
            center: LatLng(14.4974, -14.4524), // Coordonnées du centre de la carte (Senegal)
            zoom: 7.0, // Niveau de zoom initial
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", // Source des tuiles de la carte (OpenStreetMap)
              subdomains: ['a', 'b', 'c'], // Sous-domaines pour les tuiles de la carte
            ),
          ],
        ),
      ),
    );
  }
}
