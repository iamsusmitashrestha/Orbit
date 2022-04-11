import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/models/payment.dart';
import 'package:orbit/features/profile_setup/view_models/payment_methods_vm.dart';
import 'package:orbit/features/profile_setup/widgets/payment_card.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class PaymentMethodView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentMethodViewModel>.reactive(
      viewModelBuilder: () => locator<PaymentMethodViewModel>(),
      onModelReady: (model) => model.initialise(),
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
        floatingActionButton: model.isBusy
            ? KBusy()
            : FloatingActionButton.extended(
                backgroundColor: PRIMARY_COLOR,
                onPressed: () => model.addQR(context),
                icon: Icon(Icons.upload_file),
                label: Text("Upload QR"),
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
            model.paymentOptions.isEmpty
                ? Text("Upload a QR. No QR FOUND!")
                : Image.network(
                    model.dio.options.baseUrl + model.paymentOptions[0],
                    width: double.infinity)
          ],
        ),
      ),
    );
  }
}
