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
    email = value;
  }

  onCreateAccountClick() {
    navigationService.navigateTo(Routes.signupViewRoute);
  }

  void onSignin() async {
    print("ankit");
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

      print("message");
      goToProfileSetup();
      print("messages");
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        print("sus");
        String message = e.response?.data['message'];
        snackbarService.showSnackbar(message: message.trim());
      }
    }
  }

  goToProfileSetup() {
    navigationService.navigateTo(Routes.profileSetupViewRoute);
  }
}
