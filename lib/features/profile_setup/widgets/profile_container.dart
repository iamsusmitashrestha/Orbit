import 'package:flutter/material.dart';
import 'package:orbit/themes/app_themes.dart';

Widget buildProfileContainer(
    BuildContext context, String title1, String title2, bool hasTitle2) {
  return Container(
    height: 180,
    width: MediaQuery.of(context).size.width * 0.44,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title1,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        if (hasTitle2)
          Text(
            title2,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
      ],
    ),
    decoration: BoxDecoration(
      color: PRIMARY_COLOR,
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
