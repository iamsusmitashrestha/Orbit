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
                onPressed: model.addPayment,
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
            model.isBusy
                ? KBusy()
                : GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 0.5,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: List.generate(
                      model.paymentOptions.length,
                      (index) {
                        PaymentModel paymentOption =
                            model.paymentOptions[index];

                        return Column(
                          children: [
                            PaymentCard(
                              img: paymentOption.image,
                              isPaymentSelected: model.selectedPayments
                                  .contains(paymentOption),
                              onpressed: () =>
                                  model.selectPayment(paymentOption),
                            ),
                            Text(paymentOption.value),
                          ],
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
