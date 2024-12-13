import 'package:flutter/material.dart';

import '../screens/tab/home_tab.dart';
import '../screens/tab/list_tab.dart';

class HomeStateProvider extends ChangeNotifier {
  HomeStateProvider();

  int _currentPage = 0;

  final List<Widget> _tabs = [
    const HomeTab(),
    const ListTab(),
  ];

  int get currentIndex => _currentPage;

  Widget get currentTab => _tabs[_currentPage];

  void onPageChange(int newPage) {
    _currentPage = newPage;
    notifyListeners();
  }

}