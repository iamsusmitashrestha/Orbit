import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/view_models/payment_methods_vm.dart';
import 'package:orbit/features/profile_setup/widgets/payment_card.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class PaymentMethodView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentMethodViewModel>.reactive(
      viewModelBuilder: () => locator<PaymentMethodViewModel>(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 26,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          elevation: 0.0,
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: PRIMARY_COLOR,
          onPressed: () {},
          icon: Icon(Icons.save),
          label: Text("Save"),
        ),
        body: ListView(
          padding: AppDimens.PAGE_PADDING,
          children: [
            SvgPicture.asset(
              "assets/images/payment.svg",
              height: 200,
              width: 100,
              fit: BoxFit.contain,
            ),
            lHeightSpan,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PaymentCard(
                  img: "esewa.png",
                  onpressed: () {},
                ),
                PaymentCard(
                  img: "khalti.png",
                  onpressed: () {},
                ),
              ],
            ),
            mHeightSpan,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PaymentCard(
                  img: "fonepay.png",
                  onpressed: () {},
                ),
                PaymentCard(
                  img: "imepay.png",
                  onpressed: () {},
                ),
              ],
            ),
            mHeightSpan,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PaymentCard(
                  img: "prabhupay.png",
                  onpressed: () {},
                ),
                PaymentCard(
                  img: "cash.png",
                  onpressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
