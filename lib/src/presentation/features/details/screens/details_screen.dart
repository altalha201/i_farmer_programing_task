import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/configs.dart';
import '../../../common/widgets/content_details_row.dart';
import '../../../common/widgets/content_playable.dart';
import '../../../common/widgets/content_tag.dart';
import '../../../common/widgets/loading_wait_text.dart';
import '../provider/details_state_provider.dart';
import '../widgets/details_page_headline.dart';
import '../widgets/details_page_table.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late CustomVideoPlayerController _playerController;

  final _playerSetting = CustomVideoPlayerSettings(
    placeholderWidget: const AspectRatio(
      aspectRatio: 16 / 9,
      child: LoadingWaitText(),
    ),
    thumbnailWidget: const AspectRatio(
      aspectRatio: 16 / 9,
      child: ContentPlayable(),
    ),
    customVideoPlayerProgressBarSettings: CustomVideoPlayerProgressBarSettings(
      progressColor: ColorConfig.kRainbowOrange,
      backgroundColor: ColorConfig.kRainbowOrange.withOpacity(0.2),
      bufferedColor: ColorConfig.kRainbowOrange.withOpacity(0.1),
    ),
  );

  @override
  void initState() {
    super.initState();
    var source = context.read<DetailsStateProvider>().currentVideo;
    var controller = CachedVideoPlayerController.network(source)
      ..initialize().then((_) {
        setState(() {});
      });
    _playerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: controller,
      customVideoPlayerSettings: _playerSetting,
    );
  }

  @override
  void dispose() {
    _playerController.videoPlayerController;
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Visibility(
          visible: !context.watch<DetailsStateProvider>().loading,
          replacement: const LoadingWaitText(),
          child: Column(
            children: [
              CustomVideoPlayer(
                customVideoPlayerController: _playerController,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Consumer<DetailsStateProvider>(
                        builder: (c, provider, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContentDetailsRow(
                            item: provider.shortDetails,
                            showTag: false,
                            posterWidth: 120,
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: [
                              ...provider.tags
                                  .where((e) => e.content != null)
                                  .map(
                                    (e) => ContentTag(
                                      content: e.content!,
                                      background: e.background,
                                      textStyle: SubTitleTextStyle(
                                        color: e.foreground,
                                      ),
                                      foreground: e.foreground,
                                    ),
                                  )
                            ],
                          ),
                          const DetailsPageHeadlines(
                            headline: "Content Details",
                          ),
                          Text(
                            provider.plot,
                            textAlign: TextAlign.justify,
                            style: const SubTitleTextStyle(
                              color: ColorConfig.kWhite,
                            ),
                          ),
                          const SizedBox(height: 8),
                          DetailsPageTable(
                            list: provider.info,
                          ),
                          const DetailsPageHeadlines(
                            headline: "Ratings",
                          ),
                          DetailsPageTable(
                            list: provider.ratings,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
