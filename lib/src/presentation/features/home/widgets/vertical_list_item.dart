import 'package:flutter/material.dart';

import '../../../../core/config/configs.dart';
import '../../../../domain/entity/search_entity.dart';
import '../../../common/widgets/content_details_row.dart';

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
          child: InkWell(
            onTap: () {
              RoutingConfig.of(context).goToDetails(item.imdbID ?? "");
            },
            child: ContentDetailsRow(item: item),
          ),
        ),
        const Divider(color: ColorConfig.kWhite),
      ],
    );
  }
}
