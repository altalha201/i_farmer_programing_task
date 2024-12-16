import 'package:flutter/material.dart';

import '../../../core/config/configs.dart';

class ContentTag extends StatelessWidget {
  const ContentTag({
    super.key,
    required this.content,
    this.background = ColorConfig.kRainbowOrange,
    this.foreground = ColorConfig.kWhite, this.textStyle,
  });

  final String content;
  final Color? background;
  final Color? foreground;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        content,
        style: textStyle ?? TagTextStyle(color: foreground),
      ),
    );
  }
}
