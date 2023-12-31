import 'package:flutter/material.dart';
import 'package:mn_app/background.dart';
import 'package:mn_app/home_page.dart';
import 'package:mn_app/basededonnee.dart';
import 'InscriptionPassager.dart';

class LoginScreen extends StatelessWidget {
  var loginController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  Future<void> fetchData(BuildContext context) async {
    if (loginController.text.isEmpty || passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text("Veuillez remplir tous les champs"),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
      return;
    }

    final isValidCredentials = await Database.verifyCredentials(
      loginController.text,
      passwordController.text,
    );

    if (isValidCredentials) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage(numeroTelephone: 'numero', prenom: 'prenom', nom: 'nom',)),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text("Identifiant ou mot de passe incorrect"),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "CONNEXION",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 36,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: loginController,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "ID",
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: passwordController,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Mot de passe",
                  labelStyle: TextStyle(color: Colors.white),
                ),
                obscureText: true,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {},
                child: const Text(
                  "Mot de passe oublié",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: () async {
                  if (await Database.verifyCredentials(loginController.text, passwordController.text)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(numeroTelephone: 'numero', prenom: 'prenom', nom: 'nom',)),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text("Identifiant ou mot de passe incorrect"),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      },
                    );
                    return;
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.red,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    "Se connecter",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InscriptionPassagerPage()),
                  );
                },
                child: const Text(
                  "Créer un nouveau compte",
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
    );
  }
}

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    final firstControlPoint = Offset(size.width * 0.6, 0);
    final firstEndPoint = Offset(size.width * 0.58, 44);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    final secControlPoint = Offset(size.width * 0.55, 50);
    final secEndPoint = Offset(size.width * 0.5, 50);
    path.quadraticBezierTo(
      secControlPoint.dx,
      secControlPoint.dy,
      secEndPoint.dx,
      secEndPoint.dy,
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
