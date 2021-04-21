import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/themes/app_themes.dart';

class KError extends StatelessWidget {
  final String error;
  final void Function() onPressed;

  KError({required this.error, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: ERROR_COLOR),
          ),
          mHeightSpan,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KButton(
                  child: Row(
                    children: [
                      Icon(Icons.refresh),
                      mWidthSpan,
                      Text("Try Again"),
                    ],
                  ),
                  onPressed: onPressed),
            ],
          )
        ],
      ),
    );
  }
}
