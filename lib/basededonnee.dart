import 'package:mysql1/mysql1.dart';

class Database {
  static Future<MySqlConnection> connect() async {
    final settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: '',
      db: 'covoiturage',
    );

    return await MySqlConnection.connect(settings);
  }

  static Future<bool> verifyCredentials(String prenom, String password) async {
    final conn = await connect();

    final results = await conn.query(
      'SELECT COUNT(*) as count FROM users WHERE prenom = ? AND password = ?',
      [prenom, password],
    );

    await conn.close();

    final count = results.first['count'] as int;

    return count == 1;
  }

  static Future<List<Map<String, dynamic>>> fetchPassagers() async {
    final conn = await connect();

    final results = await conn.query('SELECT * FROM passager');

    await conn.close();

    return results.map((row) => row.fields).toList();
  }

  static Future<void> insertPassager(String nom, String prenom,
      String motDePasse, String numeroTelephone) async {
    final conn = await connect();

    await conn.query(
      'INSERT INTO passager (nom, prenom, mot_de_passe, numero_telephone) VALUES (?, ?, ?, ?)',
      [nom, prenom, motDePasse, numeroTelephone],
    );

    await conn.close();
  }

  static Future<List<Map<String, dynamic>>> fetchConducteurs() async {
    final conn = await connect();

    final results = await conn.query('SELECT * FROM conducteur');

    await conn.close();

    return results.map((row) => row.fields).toList();
  }

  static Future<void> insertConducteur(String nom, String prenom,
      String motDePasse, String numeroTelephone, String matricule) async {
    final conn = await connect();

    await conn.query(
      'INSERT INTO conducteur (nom, prenom, mot_de_passe, numero_telephone, matricule) VALUES (?, ?, ?, ?, ?)',
      [nom, prenom, motDePasse, numeroTelephone, matricule],
    );

    await conn.close();
  }
}
