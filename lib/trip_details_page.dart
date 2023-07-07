import 'package:flutter/material.dart';

class TripDetailsPage extends StatelessWidget {
  final int tripIndex;

  TripDetailsPage({required this.tripIndex});

  @override
  Widget build(BuildContext context) {
    // Simulation de données du trajet
    final tripData = simulateTripData(tripIndex);

    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du trajet'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Trajet ${tripData.tripNumber}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DataTable(
              columns: [
                DataColumn(label: Text('Information')),
                DataColumn(label: Text('Valeur')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Départ')),
                  DataCell(Text(tripData.departure)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Arrivée')),
                  DataCell(Text(tripData.destination)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Distance (km)')),
                  DataCell(Text(tripData.distance.toString())),
                ]),
                DataRow(cells: [
                  DataCell(Text('Durée (minutes)')),
                  DataCell(Text(tripData.duration.toStringAsFixed(1))),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Simulation de données de trajet
  TripData simulateTripData(int tripIndex) {
    // Remplacez cette logique par votre propre logique de récupération des données de trajet

    final tripNumbers = ['1', '2', '3', '4', '5'];
    final departures = [
      'Rufisque',
      'Parcelles assainies',
      'Sangalkam',
      'Yoff',
      'Guédiawaye'
    ];
    final destinations = ['Colobane', 'Almadies', 'Ouakam', 'Thiès', 'Touba'];
    final distances = [31, 15, 38, 72, 182];
    final durations = [46, 31, 67, 70, 151];

    return TripData(
      tripNumber: tripNumbers[tripIndex],
      departure: departures[tripIndex],
      destination: destinations[tripIndex],
      distance: distances[tripIndex],
      duration: durations[tripIndex].toDouble(),
    );
  }
}

// Modèle de données du trajet
class TripData {
  final String tripNumber;
  final String departure;
  final String destination;
  final int distance;
  final double duration;

  TripData({
    required this.tripNumber,
    required this.departure,
    required this.destination,
    required this.distance,
    required this.duration,
  });
}
