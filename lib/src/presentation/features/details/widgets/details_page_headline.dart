import 'package:flutter/material.dart';

import '../../../../core/config/configs.dart';

class DetailsPageHeadlines extends StatelessWidget {
  const DetailsPageHeadlines({
    super.key, required this.headline,
  });

  final String headline;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorConfig.kRainbowOrange.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        headline,
        style: const SubTitleTextStyle(color: ColorConfig.kWhite),
      ),
    );
  }
}
