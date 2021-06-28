import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/themes/app_themes.dart';

class PaymentCard extends StatelessWidget {
  final String img;
  final void Function() onpressed;
  PaymentCard({required this.img, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        height: MediaQuery.of(context).size.width * 0.23,
        width: MediaQuery.of(context).size.width * 0.43,
        padding: mPadding,
        decoration: BoxDecoration(
          border: Border.all(
            color: SHUTTLE_GREY,
          ),
        ),
        child: Image.asset(
          "assets/images/$img",
          height: 20,
          width: 40,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
