import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'infosutilisateur.dart';
import 'login.dart';
import 'search_page.dart';
import 'trip_details_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covoiturage App'),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(FontAwesomeIcons.user),
            onSelected: (value) {
              if (value == 'info') {
                navigateToUserProfile(context);
              } else if (value == 'logout') {
                performLogout(context);
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'info',
                  child: Text('Informations utilisateur'),
                ),
                PopupMenuItem(
                  value: 'logout',
                  child: Text('Déconnexion'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/covoitur.jpg'), // Chemin de l'image de fond
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.car,
                        size: 60,
                        color: Colors.white,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Bienvenue dans Covoiturage App',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          navigateToSearchPage(context);
                        },
                        child: Text('Rechercher un trajet'),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Trajets populaires',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount:
                          5, // Remplacez par le nombre réel de trajets disponibles
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(
                                'Trajet ${index + 1}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                'Détails du trajet',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              onTap: () {
                                navigateToTripDetailsPage(context, index);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void navigateToSearchPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchPage()),
    );
  }

  void navigateToTripDetailsPage(BuildContext context, int tripIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TripDetailsPage(tripIndex: tripIndex),
      ),
    );
  }

  void navigateToUserProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserProfilePage(
            userName: 'Modou Ndiaye',
            userEmail: 'modou.ndiaye@example.com',
            userPhotoUrl: 'assets/images/modou.jpg',
            numero: '772839590'),
      ),
    );
  }

  void performLogout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false,
    );
  }
}
