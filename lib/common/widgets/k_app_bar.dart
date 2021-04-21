import 'package:flutter/material.dart';
import 'package:orbit/common/widgets/k_headline.dart';

PreferredSizeWidget kAppBar({
  List<Widget>? actions,
  required String title,
  bool centerTitle = false,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    centerTitle: centerTitle,
    elevation: 0,
    bottom: bottom,
    title: KHeadline(
      title,
      size: HeadlineSize.MEDIUM,
    ),
    actions: actions,
  );
}
