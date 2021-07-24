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
          width: MediaQuery.of(context).size.width * 0.44,
          decoration: BoxDecoration(
            border: Border.all(
              color: SHUTTLE_GREY,
            ),
          ),
          child: Image.network(
            img,
            fit: BoxFit.contain,
          )),
    );
  }
}
