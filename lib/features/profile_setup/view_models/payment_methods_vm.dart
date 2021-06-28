import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/services/user_data_service.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class PaymentMethodViewModel extends BaseViewModel {
  final UserDataService userDataService;
  final SnackbarService _snackbarService;
  final Dio _dio;

  PaymentMethodViewModel(
      this.userDataService, this._snackbarService, this._dio);
}
