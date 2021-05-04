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
    print("ankit");
    try {
      var response = await _dio.post(
        "/user/register",
        data: {
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
        },
      );

      print("message");
      goToLogin();
      print("messages");
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        print("sus");
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message.trim());
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

  goToLogin() {
    print("go");
    _navigationService.navigateTo(Routes.signinViewRoute);
    print("gi");
  }
}
