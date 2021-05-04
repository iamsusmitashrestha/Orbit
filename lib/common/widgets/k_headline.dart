import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/themes/app_themes.dart';

enum HeadlineSize { SMALL, MEDIUM, LARGE }

class KHeadline extends StatelessWidget {
  final HeadlineSize size;
  final String text;
  final TextOverflow? overflow;

  KHeadline(this.text, {this.size = HeadlineSize.SMALL, this.overflow});

  TextStyle? getTextStyleBySize(BuildContext context, HeadlineSize size) {
    switch (size) {
      case HeadlineSize.SMALL:
        return Theme.of(context).textTheme.bodyText1?.copyWith(
            color: BODY_COLOR, fontSize: AppDimens.HEADLINE_FONT_SIZE_SMALL);
      case HeadlineSize.MEDIUM:
        return Theme.of(context).textTheme.headline5?.copyWith(
            color: BODY_COLOR, fontSize: AppDimens.HEADLINE_FONT_SIZE_MEDIUM);
      case HeadlineSize.LARGE:
        return Theme.of(context).textTheme.headline4?.copyWith(
            color: BODY_COLOR, fontSize: AppDimens.HEADLINE_FONT_SIZE_LARGE);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: getTextStyleBySize(context, size),
    );
  }
}
