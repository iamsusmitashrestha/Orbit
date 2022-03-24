import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class VerifyCodeViewModel extends BaseViewModel {
  String code = "";
  String role = "";

  final Dio _dio;
  final NavigationService _navigationService;
  final SnackbarService _snackbarService;
  final LocalStorageService localStorageService;

  VerifyCodeViewModel(this._dio, this._navigationService, this._snackbarService,
      this.localStorageService);

  initialise() {
    role = localStorageService.read("role")!;
    notifyListeners();
  }

  onVerify() async {
    try {
      setBusy(true);

      var response = await _dio.post(
        role == "vendor" ? "/user/verify" : "/customer/verify",
        data: {
          'confirmationCode': code,
        },
      );
      print("code:$code");
      _navigationService.navigateTo(Routes.signinViewRoute);
      setBusy(false);
    } on DioError catch (e) {
      setBusy(false);

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
