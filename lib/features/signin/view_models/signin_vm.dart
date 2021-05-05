import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class SigninViewModel extends BaseViewModel {
  String email = "";
  String password = "";
  final NavigationService navigationService;
  final SnackbarService snackbarService;
  final LocalStorageService localStorageService;
  final Dio dio;
  SigninViewModel(
      {required this.navigationService,
      required this.snackbarService,
      required this.dio,
      required this.localStorageService});

  onEmailChanged(value) {
    email = value;
  }

  onPasswordChanged(value) {
    password = value;
  }

  onCreateAccountClick() {
    navigationService.navigateTo(Routes.signupViewRoute);
  }

  void onSignin() async {
    try {
      var response = await dio.post(
        "/user/",
        data: {
          'email': email,
          'password': password,
        },
      );
      localStorageService.write("token", response.data['token']);
      navigationService.replaceWith(Routes.profileSetupViewRoute);

      goToProfileSetup();
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response?.data['message'];
        snackbarService.showSnackbar(message: message.trim());
      }
    }
  }

  goToProfileSetup() {
    navigationService.navigateTo(Routes.profileSetupViewRoute);
  }

  onForgetPassword() async {
    try {
      print("f");
      var response = await dio.post("/user/passwordResetToken",
          data: {
            'email': email,
          },
          options: Options(headers: {
            "x-auth-token": "Bearer ${localStorageService.read('token')}"
          }));
      print("g");

      localStorageService.write("token", response.data['token']);
      navigationService.navigateTo(Routes.signinViewRoute);
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response?.data['message'];
        snackbarService.showSnackbar(message: message.trim());
      }
    }
  }

  goToForgetPassword() {
    navigationService.navigateTo(Routes.forgetPasswordViewRoute);
  }
}
