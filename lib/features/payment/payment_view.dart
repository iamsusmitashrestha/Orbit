import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/common/widgets/k_error.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:stacked_services/stacked_services.dart';

class PaymentView extends StatefulWidget {
  final String storeId;
  final String total;
  const PaymentView({Key? key, required this.storeId, required this.total})
      : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  List<String> images = [];
  bool loading = false;
  final dio = locator<Dio>();

  Future<void> getImage() async {
    final snackbarService = locator<SnackbarService>();
    setState(() {
      loading = true;
    });
    try {
      final response = await dio.get("/store/getpaymentQR/" + widget.storeId);
      setState(() {
        images = response.data.map<String>((e) => e.toString()).toList();
      });
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = "";

        snackbarService.showSnackbar(message: message.trim());
      }
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make Payment"),
      ),
      body: loading
          ? KBusy()
          : images.isEmpty
              ? KError(
                  error:
                      "No online payment available for this vendor. Please do cash on delivery.",
                  onPressed: () {
                    getImage();
                  })
              : SafeArea(
                  child: Container(
                    padding: AppDimens.PAGE_PADDING,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Grand Total: NPR " + widget.total),
                        Image.network(
                          dio.options.baseUrl + images[0],
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
