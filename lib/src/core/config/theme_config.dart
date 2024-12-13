import 'package:flutter/material.dart';

import 'color_config.dart';

class ThemeConfig {
  static ThemeMode get themeMode => ThemeMode.dark;

  static ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorConfig.kRainbowOrange,
          primary: ColorConfig.kRainbowOrange,
          onPrimary: ColorConfig.kBlack,
          error: ColorConfig.kCoralRed,
          onError: ColorConfig.kBlack,
        ),
        scaffoldBackgroundColor: ColorConfig.kBlack,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: ColorConfig.kRainbowOrange,
        ),
      );
}
