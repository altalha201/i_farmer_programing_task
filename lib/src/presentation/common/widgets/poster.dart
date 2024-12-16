import 'package:flutter/material.dart';

import '../../../core/config/configs.dart';

class Poster extends StatelessWidget {
  const Poster({
    super.key,
    required this.posterUrl,
    required this.width,
  });

  final String posterUrl;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: posterUrl.isEmpty || posterUrl.isNotAvailable
              ? AssetImage(AssetsConfig.images.kNoPoster)
              : NetworkImage(posterUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: const AspectRatio(
        aspectRatio: 9/16,
      ),
    );
  }
}
