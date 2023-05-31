import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDbBaseUrl =
      dotenv.env['THE_MOVIEDB_BASE_URL'] ?? 'No url found';
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No key found';
}
