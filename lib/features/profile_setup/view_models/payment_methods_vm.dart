import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:orbit/features/profile_setup/models/payment.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class PaymentMethodViewModel extends BaseViewModel {
  final UserDataService userDataService;
  final SnackbarService _snackbarService;
  final Dio _dio;

  List<PaymentModel> paymentOptions = [];

  PaymentMethodViewModel(
      this.userDataService, this._snackbarService, this._dio);

  initialise() {
    getData();
  }

  getData() async {
    setBusy(true);
    try {
      var response = await _dio.get("/store/paymentOptions");
      paymentOptions = response.data
          .map<PaymentModel>((paymentOption) =>
              PaymentModel.fromJson(paymentOption, _dio.options.baseUrl))
          .toList();

      setBusy(false);
    } on DioError catch (e) {
      setError("Something went wrong !");
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = "";
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
  }
}
