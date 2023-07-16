import 'package:flutter/material.dart';
import 'package:mn_app/InscriptionConducteur.dart';
import 'package:mn_app/InscriptionPassager.dart';

class ChoixUtilisateurPage extends StatelessWidget {
  const ChoixUtilisateurPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choix Utilisateur'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/rafet.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => InscriptionPassagerPage()),
                  );
                },
                child: Text('Je suis un passager'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => InscriptionConducteurPage()),
                  );
                },
                child: Text('Je suis un conducteur'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}