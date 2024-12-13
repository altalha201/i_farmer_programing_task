import 'package:flutter_dotenv/flutter_dotenv.dart';

class SecretsConfig {
  static Future<void> load() async {
    await dotenv.load(fileName: ".env");
  }

  static String get kApiKey => dotenv.get("OMDB_API_KEY");
}