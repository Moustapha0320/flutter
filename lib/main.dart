import 'package:flutter/material.dart';
import 'package:mn_app/ChoixUtilisateur_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon application',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChoixUtilisateurPage(),
    );
  }
}
