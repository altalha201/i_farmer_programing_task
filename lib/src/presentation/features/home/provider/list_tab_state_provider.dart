import 'package:flutter/material.dart';

import '../../../../core/config/configs.dart';
import '../../../../domain/entity/search_entity.dart';
import '../../../../domain/use_case/search_for_title_marvel.dart';

class ListTabStateProvider extends ChangeNotifier {
  final SearchForTitleMarvel _titleMarvel;

  int _currentPage = 1;

  bool _hasMoreData = true;
  bool _isLoading = true;

  final List<SearchEntity> _entertainments = [];

  bool get hasMore => _hasMoreData;
  bool get isLoading => _isLoading;

  List<SearchEntity> get entertainments => _entertainments;

  ListTabStateProvider({required SearchForTitleMarvel titleMarvel}) : _titleMarvel = titleMarvel;

  Future<void> init() async {
    _currentPage = 1;
    _hasMoreData = true;
    _isLoading = true;
    _entertainments.clear();
    await getData();
  }

  Future<void> getData() async {
    if (!_isLoading) {
      _updateLoading(true);
    }
    try {
      final response = await _titleMarvel.execute(_currentPage);
      final totalResult = int.parse(response.totalResults ?? "0");
      _entertainments.addAll(response.search ?? []);
      _currentPage++;
      _hasMoreData = _entertainments.length < totalResult;
    } catch (e, s) {
      errorLogger(e, s, e.toString());
      if (e is NotFoundException) {
        _hasMoreData = false;
        ToastConfig.showToast("Reached at end");
      } else if (e is FetchDataException && e.message != null) {
        ToastConfig.errorToast(e.message.toString());
      } else {
        ToastConfig.errorToast(e.toString());
      }
    } finally {
      _updateLoading(false);
    }
  }

  void _updateLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}