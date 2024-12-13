import 'package:flutter/material.dart';

import 'common_text_widget.dart';

class LoadingWaitText extends StatelessWidget {
  const LoadingWaitText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 8.0),
            CommonTextWidget(
              "Please wait...",
            ),
          ],
        ),
      ),
    );
  }
}
