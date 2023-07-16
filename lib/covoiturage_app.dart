import 'package:flutter/material.dart';
import 'home_page.dart';

class CovoiturageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covoiturage App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(numeroTelephone: 'numero', prenom: 'prenom', nom: 'nom',),
    );
  }
}
