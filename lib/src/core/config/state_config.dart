import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../data/repository/omdb_repo_imp.dart';
import '../../data/repository/video_repo_impl.dart';
import '../../data/source/api/api.dart';
import '../../domain/repository/omdb_repository.dart';
import '../../domain/repository/video_repository.dart';
import '../../domain/use_case/use_cases.dart';
import '../../presentation/features/details/provider/details_state_provider.dart';
import '../../presentation/features/home/provider/home_state_provider.dart';
import '../../presentation/features/home/provider/list_tab_state_provider.dart';

class StateConfig {
  static final ApiSource _api = ApiImpl();

  static final OMDbRepository _omdbRepo = OMDbRepoImp(api: _api);
  static final VideoRepository _videoRepository = VideoRepoImpl();

  static final SearchForTitleMarvel _titleMarvel =
      SearchForTitleMarvel(repository: _omdbRepo);
  static final GetVideoUrl _getVideoUrl = GetVideoUrl(_videoRepository);
  static final GetFullDetails _getFullDetails = GetFullDetails(_omdbRepo);

  static List<SingleChildWidget> get providers => [
        ChangeNotifierProvider<HomeStateProvider>(
          create: (_) => HomeStateProvider(),
        ),
        ChangeNotifierProvider<ListTabStateProvider>(
          create: (_) => ListTabStateProvider(
            titleMarvel: _titleMarvel,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailsStateProvider(
            getVideoUrl: _getVideoUrl,
            fullDetails: _getFullDetails,
          ),
        ),
      ];
}
