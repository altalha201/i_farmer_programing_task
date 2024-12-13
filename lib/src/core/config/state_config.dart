import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../data/repository/search_repo_imp.dart';
import '../../data/source/api.dart';
import '../../domain/repository/search_repository.dart';
import '../../domain/use_case/use_cases.dart';
import '../../presentation/features/home/provider/home_state_provider.dart';
import '../../presentation/features/home/provider/list_tab_state_provider.dart';

class StateConfig {
  static final ApiSource _api = ApiImpl();

  static final SearchRepository _repository = SearchRepoImp(api: _api);

  static final SearchForTitleMarvel _titleMarvel =
      SearchForTitleMarvel(repository: _repository);

  static List<SingleChildWidget> get providers => [
        ChangeNotifierProvider<HomeStateProvider>(
          create: (_) => HomeStateProvider(),
        ),
        ChangeNotifierProvider<ListTabStateProvider>(
          create: (_) => ListTabStateProvider(
            titleMarvel: _titleMarvel,
          ),
        )
      ];
}
