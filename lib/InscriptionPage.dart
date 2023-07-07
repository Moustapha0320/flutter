import 'package:flutter/material.dart';
import 'package:mn_app/background.dart';
import 'package:mn_app/login.dart';
import 'package:mn_app/basededonnee.dart';

class InscriptionPage extends StatelessWidget {
  final String userType;

  InscriptionPage({required this.userType});

  String nom = '';
  String prenom = '';
  String numero = '';
  String motDePasse = '';
  String confirmerMDP = '';
  String matricule = '';
  final _formKey = GlobalKey<FormState>();

  void _handleInscription(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Effectuer le traitement d'inscription en fonction du userType
      if (userType == 'passager') {
        // Inscription d'un passager
        Database.insertPassager(nom, prenom, motDePasse, numero).then((_) {
          // Rediriger vers la page de connexion
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }).catchError((error) {
          // Gérer les erreurs d'inscription
          // Afficher un message d'erreur, enregistrer dans des logs, etc.
        });
      } else if (userType == 'conducteur') {
        // Inscription d'un conducteur
        Database.insertConducteur(nom, prenom, motDePasse, numero, matricule)
            .then((_) {
          // Rediriger vers la page de connexion
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }).catchError((error) {
          // Gérer les erreurs d'inscription
          // Afficher un message d'erreur, enregistrer dans des logs, etc.
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Nom"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Entrez un nom';
                  }
                  return null;
                },
                onChanged: (val) => nom = val,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Prénom"),
                validator: (val) => val!.isEmpty ? 'Entrez un prénom' : null,
                onChanged: (val) => prenom = val,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration:
                    const InputDecoration(labelText: "Numéro de téléphone"),
                validator: (val) =>
                    val!.isEmpty ? 'Entrez un numéro de téléphone' : null,
                onChanged: (val) => numero = val,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Mot de passe"),
                validator: (val) =>
                    val!.isEmpty ? 'Entrez un mot de passe' : null,
                onChanged: (val) => motDePasse = val,
                obscureText: true,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Confirmer le mot de passe"),
                obscureText: true,
                onChanged: (val) => confirmerMDP = val,
                validator: (val) => confirmerMDP != motDePasse
                    ? 'Les mots de passe ne correspondent pas'
                    : null,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: () => _handleInscription(context),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    "S'inscrire",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()))
                },
                child: const Text(
                  "Si vous avez déjà un compte? Connectez-vous",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
