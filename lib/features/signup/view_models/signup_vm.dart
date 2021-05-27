import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class SignupViewModel extends BaseViewModel {
  String name = "";
  String email = "";
  String password = "";
  String confirmPassword = '';

  final NavigationService _navigationService;
  final SnackbarService _snackbarService;
  final Dio _dio;

  SignupViewModel(this._navigationService, this._snackbarService, this._dio);

  void onSignup() async {
    try {
      setBusy(true);
      var response = await _dio.post(
        "/user/register",
        data: {
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
        },
      );
      setBusy(false);
      print(response.data['message']);

      _snackbarService.showSnackbar(
        message: response.data['message'],
        duration: Duration(seconds: 1),
      );
      Future.delayed(const Duration(seconds: 1), () {
        _navigationService.replaceWith(Routes.verifyCodeViewRoute);
      });
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        print("sus");
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message);
      }
    }
  }

  onNameChanged(value) {
    name = value;
  }

  onEmailChanged(value) {
    email = value;
  }

  onPasswordChanged(value) {
    password = value;
  }

  onConfirmPasswordChanged(value) {
    confirmPassword = value;
  }

  onButtonClick() {
    _navigationService.navigateTo(Routes.profileSetupViewRoute);
  }

  goToCodeVerify() {
    _navigationService.navigateTo(Routes.verifyCodeViewRoute);
  }

  goToLogin() {
    _navigationService.navigateTo(Routes.signinViewRoute);
  }
}
