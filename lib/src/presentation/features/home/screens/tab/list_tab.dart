import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/widgets/common_text_widget.dart';
import '../../../../common/widgets/loading_center.dart';
import '../../../../common/widgets/loading_wait_text.dart';
import '../../provider/list_tab_state_provider.dart';
import '../../widgets/vertical_list_item.dart';

class ListTab extends StatefulWidget {
  const ListTab({super.key});

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ListTabStateProvider>().init();

    _controller.addListener(() async {
      var stateProvider = context.read<ListTabStateProvider>();
      if (_controller.position.pixels == _controller.position.maxScrollExtent &&
          stateProvider.hasMore &&
          !stateProvider.isLoading) {
        await stateProvider.getData();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marvel"),
      ),
      body: Consumer<ListTabStateProvider>(
        builder: (context, stateProvider, _) {
          if (stateProvider.isLoading && stateProvider.entertainments.isEmpty) {
            return const LoadingWaitText();
          }
          if (!stateProvider.isLoading &&
              stateProvider.entertainments.isEmpty) {
            return const _NoDataText();
          }
          return ListView.builder(
            controller: _controller,
            itemCount: stateProvider.entertainments.length +
                (stateProvider.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == stateProvider.entertainments.length) {
                return const LoadingCenter();
              }
              return VerticalListItem(
                item: stateProvider.entertainments.elementAt(index),
              );
            },
          );
        },
      ),
    );
  }
}

class _NoDataText extends StatelessWidget {
  const _NoDataText();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: CommonTextWidget("No Data Found!"),
      ),
    );
  }
}
