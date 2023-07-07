import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userPhotoUrl;
  final String numero;

  UserProfilePage({
    required this.userName,
    required this.userEmail,
    required this.userPhotoUrl,
    required this.numero,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil utilisateur'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(userPhotoUrl),
            ),
            SizedBox(height: 20),
            DataTable(
              columns: [
                DataColumn(label: Text('Information')),
                DataColumn(label: Text('Valeur')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Nom d\'utilisateur')),
                  DataCell(Text(userName)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Email')),
                  DataCell(Text(userEmail)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Numéro de téléphone')),
                  DataCell(Text(numero)),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
