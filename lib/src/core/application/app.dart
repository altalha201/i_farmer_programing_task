import 'package:flutter/material.dart';

import '../../presentation/features/home/screens/home_page.dart';

class OMDBMovies extends StatelessWidget {
  const OMDBMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OMDB Movies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
