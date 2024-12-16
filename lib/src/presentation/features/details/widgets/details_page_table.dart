import 'package:flutter/material.dart';

import '../../../../core/config/configs.dart';
import '../../../utils/ui_utils.dart';

class DetailsPageTable extends StatelessWidget {
  const DetailsPageTable({
    super.key,
    required this.list,
  });

  final List<TableUtils> list;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: ColorConfig.kWhite),
      children: [
        ...list.map(
          (e) => TableRow(children: [
            _TableCell(
              e.tableHeader,
              true,
            ),
            _TableCell(
              e.tableData,
              false,
            ),
          ]),
        ),
      ],
    );
  }
}

class _TableCell extends StatelessWidget {
  const _TableCell(this.text, this.bold);

  final String text;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          text,
          style: SubTitleTextStyle(
            color: ColorConfig.kWhite,
            fontWeight: bold ? FontWeight.bold : null,
          ),
        ),
      ),
    );
  }
}
