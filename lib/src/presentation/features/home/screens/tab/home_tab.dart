import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/dashboard_state_provider.dart';
import '../../widgets/dashboard_slider.dart';
import '../../widgets/home_rail.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Consumer<DashboardStateProvider>(
              builder: (context, provider, _) {
                return Column(
                  children: [
                    DashboardSlider(
                      items: provider.slider,
                    ),
                    HomeRail(
                      list: provider.rail1,
                      title: "Batman Movies",
                    ),
                    HomeRail(
                      list: provider.rail2,
                      title: "Latest Batman Movies",
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
