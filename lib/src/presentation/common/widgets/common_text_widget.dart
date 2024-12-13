import 'package:flutter/material.dart';

import '../../../core/config/color_config.dart';

class CommonTextWidget extends StatelessWidget {
  const CommonTextWidget(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: ColorConfig.kRainbowOrange,
      ),
    );
  }
}
