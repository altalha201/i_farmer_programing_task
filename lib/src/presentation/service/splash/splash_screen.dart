import 'package:flutter/material.dart';

import '../../../core/config/configs.dart';
import '../../common/widgets/common_text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final double _imageSize = 128.0;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      RoutingConfig.of(context).goToHome(clearAll: true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              AssetsConfig.images.kLogo,
              height: _imageSize,
              width: _imageSize,
            ),
          ),
          const Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CommonTextWidget(
                    "Welcome to OMDb Movies Application",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
