import 'package:flutter/material.dart';

import '../../../../core/config/configs.dart';
import '../../../../domain/entity/search_entity.dart';
import '../../../common/widgets/poster.dart';

class VerticalListItem extends StatelessWidget {
  const VerticalListItem({super.key, required this.item});

  final SearchEntity item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Poster(
                  posterUrl: item.poster ?? "",
                  width: 60.0,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title ?? "",
                      style: const TitleTextStyle(),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: ColorConfig.kRainbowOrange,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        item.type?.capitalize() ?? "",
                        style: const TagTextStyle(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      "Release Year: ${item.year}",
                      style: const SubTitleTextStyle(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(color: ColorConfig.kWhite),
      ],
    );
  }
}
