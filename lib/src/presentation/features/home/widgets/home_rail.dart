import 'package:flutter/material.dart';

import '../../../../core/config/configs.dart';
import '../../../../domain/entity/search_entity.dart';
import '../../../common/widgets/poster.dart';

class HomeRail extends StatelessWidget {
  const HomeRail({super.key, required this.list, required this.title});

  final List<SearchEntity> list;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TitleTextStyle(color: ColorConfig.kRainbowOrange),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () async {
                      await RoutingConfig.of(context).goToDetails(list.elementAt(index).imdbID ?? "");
                    },
                    child: Poster(
                      posterUrl: list.elementAt(index).poster ?? "",
                      width: 168.75,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
