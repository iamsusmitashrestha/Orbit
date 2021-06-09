import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/themes/app_themes.dart';

Widget buildProfileContainer(BuildContext context, String title1, String title2,
    bool hasTitle2, String img) {
  return Card(
    elevation: 3,
    child: Container(
      height: 180,
      width: MediaQuery.of(context).size.width * 0.44,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/$img",
            width: 60,
            height: 60,
          ),
          mHeightSpan,
          Text(
            title1,
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          if (hasTitle2)
            Text(
              title2,
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: PRIMARY_COLOR, width: 0.5),
      ),
    ),
  );
}
