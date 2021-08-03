import 'package:flutter/material.dart';
import 'package:orbit/themes/app_themes.dart';

class PaymentCard extends StatelessWidget {
  final String img;
  final void Function() onpressed;
  final bool isPaymentSelected;
  PaymentCard(
      {required this.img,
      required this.onpressed,
      this.isPaymentSelected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
          height: MediaQuery.of(context).size.width * 0.23,
          width: MediaQuery.of(context).size.width * 0.44,
          decoration: BoxDecoration(
            color: isPaymentSelected ? Color(0xFFe7f9d4) : Colors.white,
            border: Border.all(
              color: isPaymentSelected ? Colors.green : SHUTTLE_GREY,
            ),
          ),
          child: Image.network(
            img,
            fit: BoxFit.contain,
          )),
    );
  }
}
