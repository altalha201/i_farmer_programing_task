import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'color_config.dart';

class ToastConfig {
  static void showToast(String message,
      {Toast toastLength = Toast.LENGTH_SHORT,
      Color? background,
      Color? foreground}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      backgroundColor: background,
      textColor: foreground,
    );
  }

  static void successToast(String message) => showToast(
        message,
        background: ColorConfig.kNeonGreen,
        foreground: ColorConfig.kBlack,
      );

  static void errorToast(String message) => showToast(
        message,
        background: ColorConfig.kCoralRed,
        foreground: ColorConfig.kBlack,
      );
}
