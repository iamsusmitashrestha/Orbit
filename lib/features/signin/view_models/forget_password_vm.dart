import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class ForgetPasswordViewModel extends BaseViewModel {
  String email = "";
  String password = "";
  final NavigationService navigationService;
  final SnackbarService snackbarService;
  final LocalStorageService localStorageService;
  final Dio dio;
  ForgetPasswordViewModel(
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

  resetPassword() {}
}
