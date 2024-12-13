import 'package:flutter/material.dart';

import 'src/core/application/app.dart';
import 'src/core/config/secrets_config.dart';

Future<void> main() async {
  await SecretsConfig.load();
  runApp(const OMDBMovies());
}
