import 'package:flutter/material.dart';

import '../../../../core/config/configs.dart';
import '../../../../core/constants/api_params.dart';
import '../../../../domain/entity/search_entity.dart';
import '../../../../domain/use_case/use_cases.dart';

class DashboardStateProvider extends ChangeNotifier {
  final GetBatmanContent _useCase;

  DashboardStateProvider(this._useCase);

  List<SearchEntity> _sliderList = [];
  List<SearchEntity> _rail1 = [];
  List<SearchEntity> _rail2 = [];

  List<SearchEntity> get slider =>_sliderList.isNotEmpty ? _sliderList.randomElements(5) : [];

  List<SearchEntity> get rail1 => _rail1;

  List<SearchEntity> get rail2 => _rail2;

  Future<void> init() async {
    Map<String, dynamic> paramsForSlider = {
      ApiParams.kPage: "1",
    };
    Map<String, dynamic> paramsForRail1 = {
      ApiParams.kPage: "2",
      ApiParams.kType: "movie",
    };
    Map<String, dynamic> paramsForRail2 = {
      ApiParams.kYear: "2022",
    };

    final responses = await Future.wait([
      _useCase.execute(paramsForSlider),
      _useCase.execute(paramsForRail1),
      _useCase.execute(paramsForRail2),
    ]).onError((e, s) {
      ToastConfig.errorToast("Something went wrong");
      errorLogger(e, s, "Error Fetching lists");
      return [[], [], []];
    });

    _sliderList = responses[0];
    _rail1 = responses[1];
    _rail2 = responses[2];
    notifyListeners();
  }
}
