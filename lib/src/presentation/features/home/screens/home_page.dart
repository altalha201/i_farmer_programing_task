import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_state_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<HomeStateProvider>().currentTab,
      bottomNavigationBar: Consumer<HomeStateProvider>(
        builder: (c, provider, _) {
          return BottomNavigationBar(
            currentIndex: provider.currentIndex,
            onTap: provider.onPageChange,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_rounded),
                label: "List",
              ),
            ],
          );
        }
      ),
    );
  }
}
