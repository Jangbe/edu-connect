import 'package:mysql1/mysql1.dart';

class Database {
  static MySqlConnection? instance;

  static Future<void> initialize() async {
    final settings = ConnectionSettings(
      host: '103.77.107.47',
      port: 3306,
      user: 'edu-user',
      password: 'edu654hf',
      db: 'edu-connect',
    );

    instance = await MySqlConnection.connect(settings);
  }
}
