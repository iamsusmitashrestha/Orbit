import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class SignupViewModel extends BaseViewModel {
  String name = "";
  String email = "";
  String password = "";
  String confirmPassword = '';
  String phoneNumber = "";
  String role = "";

  final NavigationService _navigationService;
  final SnackbarService _snackbarService;
  final LocalStorageService localStorageService;
  final Dio _dio;

  SignupViewModel(this._navigationService, this._snackbarService, this._dio,
      this.localStorageService);

  initialise() {
    role = localStorageService.read("role")!;
    notifyListeners();
  }

  void onSignup() async {
    setBusy(true);
    try {
      var response = await _dio.post(
        role == "vendor" ? "/user/register" : "/customer/register",
        data: {
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'contactNumber': phoneNumber,
        },
      );

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
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message);
      }
    }
    setBusy(false);
  }

  onNameChanged(value) {
    name = value;
  }

  onEmailChanged(value) {
    email = value;
  }

  onContactNoChanged(value) {
    phoneNumber = value;
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
