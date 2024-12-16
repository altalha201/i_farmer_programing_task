import 'package:flutter/material.dart';

import 'color_config.dart';

class TitleTextStyle extends TextStyle {
  const TitleTextStyle({super.color});

  @override
  double? get fontSize => 16;

  @override
  FontWeight? get fontWeight => FontWeight.w700;

  @override
  Color? get color => super.color ?? ColorConfig.kWhite;
}

class TagTextStyle extends TextStyle {
  const TagTextStyle({super.color});

  @override
  double? get fontSize => 10;

  @override
  FontWeight? get fontWeight => FontWeight.w500;

  @override
  Color? get color => super.color ?? ColorConfig.kWhite;
}

class SubTitleTextStyle extends TextStyle {
  const SubTitleTextStyle({super.color, super.fontWeight});

  @override
  FontWeight? get fontWeight => super.fontWeight ?? FontWeight.w400;

  @override
  double? get fontSize => 14;

  @override
  Color? get color => super.color ?? ColorConfig.kGray;
}