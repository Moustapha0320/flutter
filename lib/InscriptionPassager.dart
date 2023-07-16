import 'package:flutter/material.dart';
import 'package:mn_app/background.dart';
import 'package:mn_app/home_page.dart';
import 'package:mn_app/login.dart';
import 'package:mn_app/basededonnee.dart';

class InscriptionPassagerPage extends StatefulWidget {
  @override
  _InscriptionPassagerPageState createState() => _InscriptionPassagerPageState();
}

class _InscriptionPassagerPageState extends State<InscriptionPassagerPage> {
  final String userType = 'passager';

  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController motDePasseController = TextEditingController();
  TextEditingController confirmerMDPController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  void _handleInscription(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      String nom = nomController.text;
      String prenom = prenomController.text;
      String numero = numeroController.text;
      String motDePasse = motDePasseController.text;

      // Inscription d'un passager
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            nom: nom,
            prenom: prenom,
            numeroTelephone: numero,
          ),
        ),
      );
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
              autovalidateMode:
              _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: nomController,
                      decoration: const InputDecoration(
                        labelText: "Nom",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                      autovalidateMode:
                      _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez un nom';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: prenomController,
                      decoration: const InputDecoration(
                        labelText: "Prénom",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                      autovalidateMode:
                      _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez un prénom';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: numeroController,
                      decoration: const InputDecoration(
                        labelText: "Numéro de téléphone",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                      autovalidateMode:
                      _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez un numéro de téléphone';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: motDePasseController,
                      decoration: const InputDecoration(
                        labelText: "Mot de passe",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                      autovalidateMode:
                      _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez un mot de passe';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: confirmerMDPController,
                      decoration: const InputDecoration(
                        labelText: "Confirmer le mot de passe",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                      autovalidateMode:
                      _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirmez le mot de passe';
                        }
                        if (value != motDePasseController.text) {
                          return 'Les mots de passe ne correspondent pas';
                        }
                        return null;
                      },
                      obscureText: true,
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
                          color: Colors.red, // Nouvelle couleur : rouge
                        ),
                        padding: const EdgeInsets.all(0),
                        child: const Text(
                          "S'inscrire",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Couleur du texte : blanc
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: const Text(
                        "Si vous avez déjà un compte ? Connectez-vous",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white // Nouvelle couleur : rouge
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
