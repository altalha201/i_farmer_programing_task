import 'package:flutter/material.dart';

import '../../../../core/config/configs.dart';
import '../../../../domain/entity/content_details.dart';
import '../../../../domain/entity/search_entity.dart';
import '../../../../domain/use_case/use_cases.dart';
import '../../../utils/ui_utils.dart';

class DetailsStateProvider extends ChangeNotifier {
  final GetVideoUrl _getVideoUrl;
  final GetFullDetails _fullDetails;

  DetailsStateProvider({
    required GetVideoUrl getVideoUrl,
    required GetFullDetails fullDetails,
  })  : _getVideoUrl = getVideoUrl,
        _fullDetails = fullDetails;

  String _currentVideoUrl = "";

  bool _isLoading = true;

  ContentDetails _details = ContentDetails();

  SearchEntity _shortDetails = SearchEntity();

  String get currentVideo => _currentVideoUrl;

  bool get loading => _isLoading;

  SearchEntity get shortDetails => _shortDetails;

  List<TagUtils> get tags => _getTags();

  String get plot => _details.plot ?? "";

  List<TableUtils> get ratings => _getRatings();

  List<TableUtils> get info => _getInfoTable();

  Future<void> init(String imdbId) async {
    _updateLoading(true);
    await _getVideoUrl.execute(NoParams()).then((value) {
      _currentVideoUrl = value;
    });
    try {
      final detailsData = await _fullDetails.execute(imdbId);
      _details = detailsData;
      _shortDetails = SearchEntity(
        title: _details.title,
        year: _details.released,
        poster: _details.poster,
      );
    } catch (e, s) {
      ToastConfig.errorToast("Something went wrong");
      errorLogger(e, s, "Error Fetching Details");
    } finally {
      _updateLoading(false);
    }
  }

  List<TagUtils> _getTags() {
    return [
      if (_details.type != null && _details.rated!.isAvailable)
        TagUtils(
          content: _details.type!.capitalize,
          background: ColorConfig.kRainbowOrange,
          foreground: ColorConfig.kWhite,
        ),
      if (_details.rated != null && _details.rated!.isAvailable)
        TagUtils(
          content: _details.rated,
          background: ColorConfig.kCoralRed,
          foreground: ColorConfig.kWhite,
        ),
      if (_details.genre != null && _details.genre!.isAvailable)
        ..._details.genre!.split(",").map((g) => TagUtils(
          content: g.trim().capitalize,
          background: ColorConfig.kCoralRed,
          foreground: ColorConfig.kWhite,
        )),
      if (_details.language != null && _details.language!.isAvailable)
        ..._details.language!.split(",").map((l) => TagUtils(
          content: l.trim().capitalize,
          background: ColorConfig.kMaximumYellow,
          foreground: ColorConfig.kBlack,
        )),
      if (_details.runtime != null && _details.runtime!.isAvailable)
        TagUtils(
          content: UtilsFunctions.convertTime(_details.runtime!),
          background: ColorConfig.kNeonGreen,
          foreground: ColorConfig.kBlack,
        ),
    ];
  }

  List<TableUtils> _getRatings() {
    return _details.ratings
        ?.where((r) => r.source != null && r.source!.isAvailable)
        .map((r) => TableUtils(
      tableData: r.value?.replaceAll("/", " out of ") ?? "Unknown",
      tableHeader: r.source!,
    ))
        .toList() ??
        [];
  }

  List<TableUtils> _getInfoTable() {
    return [
      TableUtils(
        tableData: _details.director ?? "Unknown",
        tableHeader: "Director (s)",
      ),
      TableUtils(
        tableData: _details.writer ?? "Unknown",
        tableHeader: "Writer (s)",
      ),
      TableUtils(
        tableData: _details.actors ?? "Unknown",
        tableHeader: "Actors (s)",
      ),
      TableUtils(
        tableData: _details.country ?? "Unknown",
        tableHeader: "Country of Origin",
      ),
      TableUtils(
        tableData: _details.boxOffice ?? "Unknown",
        tableHeader: "Box Office Collection",
      ),
      TableUtils(
        tableData: _details.awards ?? "Unknown",
        tableHeader: "Awards",
      ),
    ];
  }

  void _updateLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
