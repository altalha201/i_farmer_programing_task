import 'package:flutter/material.dart';

import '../../../core/config/configs.dart';
import 'common_text_widget.dart';

class ContentPlayable extends StatelessWidget {
  const ContentPlayable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AssetsConfig.images.kLogo, height: 40, width: 40,),
          const SizedBox(height: 8),
          const CommonTextWidget("Play Video")
        ],
      ),
    );
  }
}
