import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/service/splash/splash_screen.dart';
import '../config/configs.dart';

class OMDBMovies extends StatelessWidget {
  const OMDBMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: StateConfig.providers,
      child: MaterialApp(
        title: 'OMDb Movies',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeConfig.themeMode,
        theme: ThemeConfig.theme,
        home: const SplashScreen(),
      ),
    );
  }
}
