import 'package:flutter/material.dart';

import '../../../core/config/configs.dart';
import '../../../domain/entity/search_entity.dart';
import 'content_tag.dart';
import 'poster.dart';

class ContentDetailsRow extends StatelessWidget {
  const ContentDetailsRow({
    super.key,
    required this.item,
    this.showTag = true, this.posterWidth,
  });

  final SearchEntity item;
  final bool showTag;
  final double? posterWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Poster(
            posterUrl: item.poster ?? "",
            width: posterWidth ?? 60.0,
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

              Visibility(
                visible: showTag,
                replacement: const SizedBox(height: 8.0),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 16.0,
                  ),
                  child: ContentTag(
                    content: item.type?.capitalize ?? "",
                  ),
                ),
              ),
              Text(
                "Released: ${item.year}",
                style: const SubTitleTextStyle(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
