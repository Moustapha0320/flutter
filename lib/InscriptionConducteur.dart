import 'package:flutter/material.dart';
import 'package:mn_app/background.dart';
import 'package:mn_app/login.dart';
import 'package:mn_app/basededonnee.dart';

class InscriptionConducteurPage extends StatefulWidget {
  @override
  _InscriptionConducteurPageState createState() => _InscriptionConducteurPageState();
}

class _InscriptionConducteurPageState extends State<InscriptionConducteurPage> {
  final String userType = 'conducteur';

  String nom = '';
  String prenom = '';
  String numero = '';
  String motDePasse = '';
  String confirmerMDP = '';
  String matricule = '';
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  void _handleInscription(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Inscription d'un conducteur
      Database.insertConducteur(nom, prenom, motDePasse, numero, matricule).then((_) {
        // Rediriger vers la page de connexion
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }).catchError((error) {
        // Gérer les erreurs d'inscription
        // Afficher un message d'erreur, enregistrer dans des logs, etc.
      });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          children: <Widget>[
        Container(
        alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20),
          child: Text(
            'INSCRIPTION',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.03),
          Form(
          key: _formKey,
          autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Nom",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
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
                  decoration: const InputDecoration(
                    labelText: "Prénom",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrez un prénom';
                    }
                    return null;
                  },
                  onChanged: (val) => prenom = val,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Numéro de téléphone",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrez un numéro de téléphone';
                    }
                    return null;
                  },
                  onChanged: (val) => numero = val,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Mot de passe",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrez un mot de passe';
                    }
                    return null;
                  },
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
                    labelText: "Confirmer le mot de passe",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                  obscureText: true,
                  onChanged: (val) => confirmerMDP = val,
                  validator: (val) => confirmerMDP != motDePasse ? 'Les mots de passe ne correspondent pas' : null,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Matricule",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrez un matricule';
                    }
                    return null;
                  },
                  onChanged: (val) => matricule = val,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                  },
                  child: const Text(
                    "Si vous avez déjà un compte ? Connectez-vous",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      ),
      ),
    );
  }
}
