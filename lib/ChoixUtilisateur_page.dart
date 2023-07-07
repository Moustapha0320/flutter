import 'package:flutter/material.dart';
import 'package:mn_app/InscriptionPage.dart';
import 'package:mn_app/login.dart';

class ChoixUtilisateurPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choix Utilisateur'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          InscriptionPage(userType: 'passager')),
                );
              },
              child: Text('Je suis un passager'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          InscriptionPage(userType: 'conducteur')),
                );
              },
              child: Text('Je suis un conducteur'),
            ),
          ],
        ),
      ),
    );
  }
}
