import 'package:flutter/material.dart';

import '../../presentation/features/home/screens/home_page.dart';

class RoutingConfig {
  final BuildContext context;

  RoutingConfig._(this.context);

  static RoutingConfig of(BuildContext context) => RoutingConfig._(context);

  void back() {
    Navigator.pop(context);
  }

  void goToHome({bool clearAll = false}) {
    var pageRoute = MaterialPageRoute(builder: (_) => const HomePage());
    if(!clearAll) {
      Navigator.of(context).push(pageRoute);
    } else {
      Navigator.of(context).pushAndRemoveUntil(pageRoute, (_) => false);
    }
  }
}