import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class VerifyCodeViewModel extends BaseViewModel {
  String code = "";

  final Dio _dio;
  final NavigationService _navigationService;
  final SnackbarService _snackbarService;

  VerifyCodeViewModel(
      this._dio, this._navigationService, this._snackbarService);

  onVerify() async {
    try {
      var response = await _dio.post(
        "/user/verify",
        data: {
          'confirmationCode': code,
        },
      );
      _navigationService.navigateTo(Routes.signinViewRoute);
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
  }

  onCodeChanged(value) {
    code = value;
  }
}
